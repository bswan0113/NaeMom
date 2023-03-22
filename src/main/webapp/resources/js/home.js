
$(function(){


    $('.curation-menu').click(function(e){
        e.preventDefault();
        $('.curation-content').removeClass('pointon');
        $('.curation-inner').removeClass('pointon2');
        $(this).find('.curation-content').addClass('pointon');
        $(this).find('.curation-inner').addClass('pointon2');
    });

     
    var swiper = new Swiper(".mySwiper", {
        scrollbar: {
          el: ".swiper-scrollbar",
          hide: true,
        },
        navigation: {
            nextEl: ".swiper-button-next",
            prevEl: ".swiper-button-prev",
          }
      });


      var k = new Swiper(".mySwiper2", {
        effect: "cube",
        grabCursor: true,
        cubeEffect: {
          shadow: true,
          slideShadows: true,
          shadowOffset: 20,
          shadowScale: 0.94,
        },
        pagination: {
          el: ".swiper-pagination",
        },
      });

      $('.choice-left .choice-btn').click(function(e){
        e.preventDefault();
        $('.choice-left .swiper').hide();
        if($(this).hasClass('lodging')){
          $('.choice-left').find('.lodging').show();
        }
        if($(this).hasClass('restraunt')){
          $('.choice-left').find('.restraunt').show();
        }
        if($(this).hasClass('place')){
          $('.choice-left').find('.place').show();
        }
      })
      
      let int =0;
      let intF =0;
      $('.choice-left .swiper-slide').click(function(e){
        e.preventDefault();
        int++;
        if(int<7 &&intF==0){
          if(int ==1){
          let img=  $(this).find('.choice-item').clone();
          img.prependTo('.item1');}
          if(int ==2){
          img=  $(this).find('.choice-item').clone();
          img.prependTo('.item2');}
          if(int ==3){
          img=  $(this).find('.choice-item').clone();
          img.prependTo('.item3');}
          if(int ==4){
          img=  $(this).find('.choice-item').clone();
          img.prependTo('.item4');}
          if(int ==5){
          img=  $(this).find('.choice-item').clone();
          img.prependTo('.item5');}
          if(int ==6){
          img=  $(this).find('.choice-item').clone();
          img.prependTo('.item6');int++;}
          
        console.log(int)
        }

          if(int>=7){
            int++; intFF=1;
            alert('6개까지만 담기가 가능해요!');}
          
      })

      $('.choice-right .daily-item').click(function(e){
        if(int>=6){
        int= 6;}
        int--;
        intF=0;
        console.log(int);
        e.preventDefault();
        $(this).find('.choice-item').remove();
      })



});
    
     


