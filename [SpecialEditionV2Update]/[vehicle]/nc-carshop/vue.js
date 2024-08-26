
const app = new Vue({
  el: '#app',
  data: {
    ui:false,
    selection:{
      category:"",
      label:"Ferrari La Ferrari",
      description:"Vorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, ut",
      model:'',
      color:'',
      price:0
    },
    payment:"cash",
    colors: { hex: '#00FFF0' },
    showPicker: false,
    hidePicker:false,
    hideTimeout: null,
    selectedColor: null,
    buymenu:false,
    platenum: "",
    features: {
      speed: {
        percentage: 0, 
      },
      acceleration: {
        percentage: 0, 
      },
      road: {
        percentage: 0, 
      },
      capacity: {
        percentage: 0, 
      },
      fuel: {
        percentage: 0, 
      }
    },
    BBackground: '', 
    CCategory: '',
    category:[],
    vehicles:[]

   },

   components: {
    'chrome-picker': VueColor.Chrome
   },

   created() {
    var self = this;
    window.addEventListener('message', function(event) {
      var item = event.data;
      switch (item.action) {
          case "CARSHOP":
            if (item.class == 'showroom'){
              self.buymenu = false;
            }else {
              self.buymenu = true;
            }
            self.ui = true;
            self.$set(self, 'vehicles', item.cars);
            self.$set(self, 'category', item.category);
            self.Cars('selection', item.cars[0]);
            self.CCategory= item.category[0].label;
            self.features.capacity.percentage = item.category[0].capacity;
            self.selection.description = item.category[0].description;
            self.selection.label = item.category[0].label;
            self.selection.text = item.category[0].text;
            self.$nextTick(() => {
              const categories = self.vehicles.map((vehicle) => vehicle.category);
              for (const cat of categories) {
                if (self.$refs[cat]) {
                  self.$refs[cat][0].classList.remove('active');
                }
              }
              if (self.$refs[self.vehicles[0].category]) {
                self.$refs[self.vehicles[0].category][0].classList.add('active');
              }
            });
          break
          case "CLOSE":
            self.ui = false;
            $.post(`https://${GetParentResourceName()}/exit`, JSON.stringify({}));
          break
      }
    });
  },  
    
   mounted(){
    const categories = this.vehicles.map((vehicle) => vehicle.category);
      for (const cat of categories) {
        if (this.$refs[cat]) {
          this.$refs[cat][0].classList.remove('active');
        }
      }
      if (this.$refs[this.vehicles[0].category]) {
        this.$refs[this.vehicles[0].category][0].classList.add('active');
      }

   },

   watch: {
    platenum(value) {
      if (typeof value === 'string') {
        if (value.length > 8) {
            value = value.slice(0, 8);
        }
        $.post(`https://${GetParentResourceName()}/SetPlate`, JSON.stringify({plate: value}));
      }
    },
    

    showPicker: function (newVal, oldVal) {
      if (newVal) {
        // console.log('Picker gösteriliyor.');
        anime({
          targets: this.$refs.animatedPayment,
          translateX: [0, 240], // Sağa ilerler
          opacity: [1, 0], // Opaklığı tamamen azaltır
          duration: 750, // 0.75 saniyede
          easing: 'easeInOutQuad',
        });
        anime({
          targets: this.$refs.animatedPicker,
          translateX: [-275, 0], // Geri sağa
          opacity: [0.5, 1], // Opaklığı 0.5'ten 1'e çıkarır
          duration: 750, // 1 saniyede
          easing: 'easeInOutQuad',
        });

        anime({
          targets: this.$refs.animatedDiv,
          translateY: [0, 250], // Aşağıya doğru 200px
          opacity: [1, 0.5], // Opaklığı 1'den 0.5'e düşürür
          duration: 1000, // 1 saniyede
          easing: 'easeInOutQuad', // easing fonksiyonunu 'easeInOutQuad' olarak değiştirdik
        })
      } else {

        anime({
          targets: this.$refs.animatedPayment,
          translateX: [275, 0], // Orijinal pozisyona geri gelir
          opacity: [0, 1], // Opaklığı tamamen artırır
          duration: 1000, // 1 saniyede
          easing: 'easeInOutQuad',
        });
        anime({
          targets: this.$refs.animatedPicker,
          translateX: [0, -275], // Sağdan sola 275px
          opacity: [1, 0.5], // Opaklığı 1'den 0.5'e düşürür
          duration: 1000, // 1 saniyede
          easing: 'easeInOutQuad',
        })

        anime({
          targets: this.$refs.animatedDiv,
          translateY: [200, 0], // Geri yukarıya
          opacity: [0.5, 1], // Opaklığı 0.5'ten 1'e çıkarır
          duration: 750, // 1 saniyede
          easing: 'easeInOutQuad', // easing fonksiyonunu 'easeInOutQuad' olarak değiştirdik
        });
        // console.log('Picker gizleniyor.');
      }
    },
  },

   methods: {

    buyCar(){
      $.post(`https://${GetParentResourceName()}/Buy`, JSON.stringify({model:this.selection.model, price:this.selection.price, color:this.selection.color, plate:this.platenum, payment:this.payment}));
    },

    testDrive(){
      $.post(`https://${GetParentResourceName()}/TestDrive`, JSON.stringify({car:this.selection.model, color:this.selection.color}));
    },

    onFocus() {
      $.post(`https://${GetParentResourceName()}/PlateCamera`);

    },

    onBlur() {
      $.post(`https://${GetParentResourceName()}/NotPlate`);
    },

    setPayment(type){
      this.payment = type;
    },

    updateColor(color) {
      this.colors.hex = color.hex;
      let rgbColor = this.convertHexToRGB(color.hex);
      this.selection.color = rgbColor;
      $.post(`https://${GetParentResourceName()}/SelectColor`, JSON.stringify({color: rgbColor}));
    },

    convertHexToRGB(hex) {
    let r = parseInt(hex.slice(1, 3), 16),
    g = parseInt(hex.slice(3, 5), 16),
    b = parseInt(hex.slice(5, 7), 16);
    return {R: r, G: g, B: b};
    },

    colorPicker() {
      this.showPicker = !this.showPicker;
    },

    calculateWidth(percentage) {
      return percentage * 0.7 + '%';
    },

    SetLeftRight(type){
      const container = this.$refs.scrollContainer;
      const currentIndex = this.category.findIndex(cat => cat.label === this.CCategory);
      let newIndex;
      if (type === 'right') {
        newIndex = (currentIndex - 1) % this.category.length;
      } else {
        newIndex = (currentIndex + 1 + this.category.length) % this.category.length;
      }
      this.Category(this.category[newIndex]);
      const selectedCategory = this.$refs[this.category[newIndex].label][0];
      container.scrollLeft = selectedCategory.offsetLeft - container.offsetLeft;
    },
    
    formatPrice(price) {
      return price.toLocaleString(); 
    },
    
    Cars(type, data) {
      if (type !== 'selection') return;
    
      let {model, price} = data;
      let rgbColor = this.convertHexToRGB(this.colors.hex);
      let url = `https://${GetParentResourceName()}/Vehicle`;
    
      $.post(url, JSON.stringify({vehicle: model, color: rgbColor}), (data) => {
        this.setFeatures(data);
        app.selection.price = price;
        app.selection.model = model;
        this.BBackground = model;
      });
    },
    
    setFeatures(data) {
      app.features.speed.percentage = (data.maxSpeed).toFixed(0);
      app.features.acceleration.percentage = (data.Acceleration).toFixed(0);
      app.features.road.percentage = (data.Handling).toFixed(0);
      app.features.fuel.percentage = (data.Fuel).toFixed(0);
    },    

    Category(eyes){
      this.CCategory = eyes.label;
      this.features.capacity.percentage = eyes.capacity;
      const categories = this.category.map((category) => category.label);
      this.selection.description = eyes.description;
      this.selection.label = eyes.label;
      this.selection.text = eyes.text;
      for (const cat of categories) {
        if (this.$refs[cat]) {
          this.$refs[cat][0].classList.remove('active');
        }
      }
      if (this.$refs[eyes.label]) {
        this.$refs[eyes.label][0].classList.add('active');
      }
    }
  }
  })
  
  let holding = false
  let direction = "", oldx = 0
  document.addEventListener('mousedown', (e) => holding = true)
  document.addEventListener('mouseup', (e) => holding = false)
  document.addEventListener('mousemove', function(e) {
    if (e.pageX < oldx) { direction = "left" } else if (e.pageX > oldx) { direction = "right" }
    oldx = e.pageX;
    if (direction == "left" && holding) {
      if (e.target.classList.contains("move")) {
        $.post(`https://${GetParentResourceName()}/rotateright`);
      }
    }
    if (direction == "right" && holding) {
      if (e.target.classList.contains("move")) {
        $.post(`https://${GetParentResourceName()}/rotateleft`);
      }
    }
  
  });
  

  document.onkeyup = function (data) {
    if (data.which == 27) {
      app.ui = false;
      $.post(`https://${GetParentResourceName()}/exit`, JSON.stringify({}));
    }
    // $(document).on('keydown', function(bind) {
    //   switch(bind.which) {
    //     case 68: // D
    //         $.post(`https://${GetParentResourceName()}/rotateright`);
    //         break;
    //     case 39: // ArrowRight
    //         $.post(`https://${GetParentResourceName()}/rotateright`);
    //         break;
    //     case 65: // A
    //         $.post(`https://${GetParentResourceName()}/rotateleft`);
    //         break;
    //     case 37: // ArrowLeft
    //         $.post(`https://${GetParentResourceName()}/rotateleft`);
    //         break;
    //   }
    // });
  };
