$(document).ready(function(){

  window.questionOptions = ["Yes, we're lovers", 'And that is that','Though nothing', 'will keep us together', 'We could steal time','Just for one day','this is too long','and that is why','you have no friends']

  $('#add_question').on('click',function(event){
    event.preventDefault();
    $.ajax({
      type: 'get',
      url: '/surveys/questions/new'
    }).done(function(q_html){    
      $('.questions_wrapper').append(q_html);
    });
  });

  $('#survey_form').on('click','#add_option',function(event){
    event.preventDefault();

    var self = this;

    $.ajax({
      type: 'get',
      url: '/surveys/questions/options/new'
    }).done(function(o_html){
      $(self).closest('.question').find('.options_wrapper').append(o_html);
      $(".options_wrapper").find("input").last().attr("placeholder", questionOptions.shift());
    });
  });

  // $('#create_survey').on('click',function(e){
  //   e.preventDefault();
  //   console.log('create_survey');

  //   var surveyName = $('.survey_name_wrapper form').serialize();
    
  //   $.ajax({
  //     type: 'post',
  //     url: '/surveys/create',
  //     data: surveyName
  //   }).done(function(data){
  //     $('.question_form .survey_id').val(data);

  //     $('.question_form').each(function(){
  //       var question = $(this).find('form').serialize();
  //       var self = this;

  //       $.ajax({
  //         type: 'post',
  //         url: '/surveys/questions/create',
  //         data: question
  //       }).done(function(data){
  //         $(self).find('.options_form .question_id').val(data);
  //         console.log("Created Question");

  //         $(self).find('.options_form').find('form').each(function(){
  //           var optionData = $(this).serialize();
  //           console.log(optionData);

  //           $.ajax({
  //             type: 'post',
  //             url: '/surveys/questions/options/create',
  //             data: optionData
  //           }).done(function(){
  //             window.location = "/users/dashboard"
  //           });

  //         });


  //       });

  //     });
  //   });
  // });

});