var close = true;
var lastData = {};
var titlesize = 2.25;
var officersize = 1.6;
var officersizeme = 1.83;
var currentAction = null;

$(document).ready(()=>{
	$('.toggle-btn').css('backgroundColor',  '#aa3126');
	
    $(document).on('input change', '#increase-size', function() {
        lastData.size =  $(this).val();
        lastData.me = Math.abs(officersizeme * $(this).val());
        lastData.title =  Math.abs(titlesize * $(this).val());
        lastData.officer = Math.abs(officersize * $(this).val());
        
        $('.title').css('font-size', `${lastData.title}rem`);
        $('.officer me').css('font-size', `${lastData.me}rem`);
        $('.officer').css('font-size', `${lastData.officer}rem`);
        $('.officer me').css('font-weight','bold');
    });
    
    $(document).on('input', '#opacity', function() {
        lastData.opacity =  $(this).val();
        ChangeBackGround($(this).val());
    });
    
    $(".restore-btn").on("click", function(){
        lastData = {};
        ChangeBackGround("0.7");
        $('.officer').css('font-size', `1rem`);
        $('.title').css('font-size', `1.35rem`);
        $('.range-inputes input').val("contrast");
        $('.officer.me').css('font-size', `1.1rem`);
    });

    
    $(".options-btns").on("click",".options-btn", function(){
        currentAction = $(this).data('action');
        SetRightInput(currentAction);
    });
    
    $(".inpurs-id").on("click",".save-btn", function(){
        if (currentAction == null){
            $('.inpurs-id #err-text').text('Please select an action');
            return;
        } else if (currentAction == "remove"){
            if ($('#id').val() == "")
            $('.inpurs-id #err-text').text('The input can not be empty!');
            else 
            SendData(null);
        } else {
            if (($('#code').val() == "") || ($('#id').val() == ""))
            $('.inpurs-id #err-text').text('The inputs can not be empty!');
            else
            SendData($('#code').val());
        }
    });
    
    $(".rank").on("click", function(){
        $('#rank-err').text("");
        if($('#rank').val() == "")
        $('#rank-err').text('The input can not be empty!');
        else 
        $.post('https://qb-10system/rank',JSON.stringify({rank : $('#rank').val()}));
    });
    

    $(".range-bar").prop('disabled', close);
    SwitchPages();
    DragAble();
    Close();
});

window.addEventListener("message", e => {
    if (e.data.action == "open") {
        if (lastData.opacity) {
            $('#opacity').val(lastData.opacity);
        } else if (lastData.size) {
            $('#increase-size').val(lastData.size);
        }
        $('.warrper').show(500);
        $('.settings-container').slideDown();
    } else if (e.data.action == "openav-10system") {
        toggle();
    }
    else if (e.data.action == "error") {
        $('.inpurs-id #err-text').text(e.data.errorText);
    } else if (e.data.action == "update" && !close) {
        var players = e.data.data;
        players.sort( (a, b) => a.callsign > b.callsign ? 1 : (a.callsign == b.callsign ? 0 : -1));

        $('.players-container').empty();
        $('.title span').text(`${players.length} ${e.data.title}`);
        for (var player of players) {
            let talkingRadio = `<span style=${player.talking ? "color:red;" : ""}>${player.radioChannel == "x" || player.radioChannel == "0" ? "Off" : player.radioChannel + " Hz"}</span>`
            var html = `
            <div class="player ${player.me ? "me" : ""}">
            <span class="tag ${player.class}">${player.callsign}</span> ${player.name} | ${player.rank} - ${talkingRadio}</span>
            </div>`
            $('.players-container').append(html);
        }
        $('.active-players').slideDown();
        $('.title').css('font-size', `${lastData.title}rem`);
        $('.player me').css('font-size', `${lastData.me}rem`);
        $('.player').css('font-size', `${lastData.player}rem`);
        $('.player me').css('font-weight', 'bold');
    } else if (e.data.action == "close") {
        if (!close) $('.active-players').slideUp();
    }
})

window.addEventListener("message",e => {
    if(e.data.action == "open"){
        if(lastData.opacity) {
            $('#opacity').val(lastData.opacity);
        } else if (lastData.size){
            $('#increase-size').val(lastData.size);
        }
        $('.warrper').show(500);
        $('.settings-container').slideDown();
    } else if (e.data.action == "hide"){
        close = true;
        $('.active-officers').hide(500);
    } else if (e.data.action == "error"){
        $('.inpurs-id #err-text').text(e.data.errorText);
    }  else if (e.data.action == "update" && !close){
        $('.officers-container').html("");
        var officers = e.data.data.sort((a, b) => {
            return a.grade < b.grade;
        });
		
		var me = null;
		
		for(var officer of officers)
		{
			if (officer.me)
			{
				me = officer
			}
		}
		
		
		if(me != null)
		{
			var count = 0
			
			
			for(var officer of officers)
			{
				if(officer.jobName == me.jobName)
				{
					count++;
					var html;
					
					let gradeColour = 'regular';
                    if (officer.callsign >= 200 && officer.callsign <= 215) {
                        gradeColour = 'command';
                    }
                    // if (officer.callsign >= 210 && officer.callsign <= 220) {
                    //     gradeColour = 'command3';
                    // }
                    if (officer.callsign >= 216 && officer.callsign <= 299) {
                        gradeColour = 'officerandcadet';
                    }
                    // corrections
                    if (officer.callsign >= 104 && officer.callsign <= 115) {
                        gradeColour = 'green';
                    }
                    if (officer.callsign >= 100 && officer.callsign <= 103) {
                        gradeColour = 'command';
                    }
                    if (officer.callsign >= 180 && officer.callsign <= 199) {
                        gradeColour = 'black';
                    }
                    // 
                    if (officer.callsign >= 300 && officer.callsign <= 349) {
                        gradeColour = 'second';
                    }
                    if (officer.callsign >= 400 && officer.callsign <= 430) {
                        gradeColour = 'orange';
                    }
                    if (officer.callsign >= 450 && officer.callsign <= 470) {
                        gradeColour = 'green';
                    }
                    if (officer.callsign >= 350 && officer.callsign <= 370) {
                        gradeColour = 'gray';
                    }
                    if (officer.callsign >= 500 && officer.callsign <= 550) {
                        gradeColour = 'darkgreen';
                    }
                    if (officer.callsign >= "V-100" && officer.callsign <= "V-550") {
                        gradeColour = 'vrob';
                    }
                    if (officer.callsign >= "B-100" && officer.callsign <= "B-550") {
                        gradeColour = 'brob';
                    }
                    if (officer.callsign >= "PB-100" && officer.callsign <= "PB-550") {
                        gradeColour = 'pacific';
                    }
                    if (officer.callsign >= "F-100" && officer.callsign <= "F-550") {
                        gradeColour = 'fbrob';
                    }
                    if (officer.callsign >= "A-100" && officer.callsign <= "A-550") {
                        gradeColour = 'abrob';
                    }
                    if (officer.callsign >= "S-100" && officer.callsign <= "S-550") {
                        gradeColour = 'sbrob';
                    }
                    if (officer.callsign >= "Y-100" && officer.callsign <= "Y-550") {
                        gradeColour = 'yacht';
                    }
                    if (officer.callsign >= "FT-100" && officer.callsign <= "FT-550") {
                        gradeColour = 'ftrob';
                    }1
                    if (officer.callsign >= "P-100" && officer.callsign <= "P-550") {
                        gradeColour = 'prob';
                    }
					// let gradeColour = Config.RankColours[officer.jobName][officer.grade] || 'lightblue';

					if (officer.me){
						if (officer.precord) {
							html = `
							<div id = "officerme" class="officer me" data-serverid="${officer.src}">
							<span class="tag ${gradeColour}">${officer.callsign}</span> ${officer.name} | ${officer.rank} - <span class="channel">${officer.channel}Hz</span><button class="record" onclick="record(${officer.src})">(<i class="fas fa-camera"></i>)</button>
							</div>`
						} else {
							html = `
							<div class="officer me" data-serverid="${officer.src}">
							<span class="tag ${gradeColour}">${officer.callsign}</span> ${officer.name} | ${officer.rank} - <span class="channel">${officer.channel}Hz</span>
							</div>`
						}
						$('.officers-container').append(html);
					} else {
						if (officer.precord){
							html = `
							<div id ="officer" class="officer" data-serverid="${officer.src}">
							<span class="tag ${gradeColour}">${officer.callsign}</span> ${officer.name} | ${officer.rank} - <span class="channel">${officer.channel}Hz</span><button class="record" onclick="record(${officer.src})">(<i class="fas fa-camera"></i>)</button>
							</div>`
						} else {
							html = `
							<div class="officer" data-serverid="${officer.src}">
							<span class="tag ${gradeColour}">${officer.callsign}</span> ${officer.name} | ${officer.rank} - <span class="channel">${officer.channel}Hz</span>
							</div>`
						}
						$('.officers-container').append(html);
					}
					if (officer.isTalking) {
						$(`.officer[data-serverid=${officer.src}] .channel`).addClass('talking');
					} else {
						$(`.officer[data-serverid=${officer.src}] .channel`).removeClass('talking');
					}
				}
			}
			
			$('.title span').text(`(${count}) - Active Officers `);
		}
		
        $('.active-officers').slideDown();
        if (lastData.title && lastData.me && lastData.officer) {
            $('.title').css('font-size', `${lastData.title}rem`);
            $('.officer me').css('font-size', `${lastData.me}rem`);
            $('.officer').css('font-size', `${lastData.officer}rem`);
        }
    } else if (e.data.action == 'radioState') {
        if (e.data.isTalking) {
            $(`.officer[data-serverid=${e.data.serverId}] .channel`).addClass('talking');
        } else {
            $(`.officer[data-serverid=${e.data.serverId}] .channel`).removeClass('talking');
        }
	} else if (e.data.action == 'radioChannel') {
		if(e.data.channel == -1)
		{
			$(`.officer[data-serverid=${e.data.serverId}] .channel`).text('OFF');
		}
		else
		{
			$(`.officer[data-serverid=${e.data.serverId}] .channel`).text(e.data.channel);
		}

    } 
})


function toggle(){
    close = !close;
    $(".range-bar").prop('disabled', close);
    if (close) $('.active-officers').slideUp();
    $.post('https://qb-10system/ToggleOpen',JSON.stringify({toggle : close}))
	
	if(close)
	{
		$('.toggle-btn').css('backgroundColor',  '#e23535');
	}
	else
	{
		$('.toggle-btn').css('backgroundColor',  '#e23535');
	}
}
function record(officersrc){
    console.log(officersrc);
    $.post('https://qb-10system/Camera',JSON.stringify({cameratoggle : officersrc}))
}

function Close(){
    $("#close-del").on("click", function(){
        currentAction = null;
        $('input').val("");
        $('.warrper').hide();
        $('.settings-container').slideUp();
        $.post('https://qb-10system/close',JSON.stringify({}));
    });
}


function SetRightInput(action){
    if(action == "remove"){
        $('#code').hide();
    } else {
        $('#code').show();
    }
}

function SendData(code){
    var data = {
        action : currentAction,
        id : $('#id').val(),
        code : code
    }
    $('.inpurs-id #err-text').text("");
    $.post('https://qb-10system/action',JSON.stringify({data : data}))
}

function ChangeBackGround(val){
    $('.active-officers').css('background-color', `rgba(0,0,0,${val})`);
    $('.title').css('background-color', `rgba(0,0,0,${addbits(val+0.05)})`);
}

function addbits(s) {
    var total = 0,
        s = s.match(/[+\-]*(\.\d+|\d+(\.\d+)?)/g) || [];
        
    while (s.length) {
      total += parseFloat(s.shift());
    }
    return total;
}

function DragAble(){
    $( ".active-officers" ).draggable({
        appendTo: 'body',
        containment: 'window',
        scroll: false,
    });
}

function SwitchPages () {
    $(".slide-btnRight").on("click", function(){
        $('.page-1').fadeIn(200);
        $('.inpurs-id').fadeOut(250);
        $('.settings-container-header span').text('Personal Settings');
    });
}

$(document).keyup(function (e) {
    if (e.keyCode == 27) {
        currentAction = null;
        $('input').val("");
        $('.warrper').hide();
        $('.settings-container').slideUp();
        $.post('https://qb-10system/close',JSON.stringify({}))
    }
});

function SendTest(data) {
    let e = new CustomEvent('message');
    e.data = data;
    window.dispatchEvent(e);
}