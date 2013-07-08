$(document).ready(function(){

  window.questionOptions = ["Yes, we're lovers", 'And that is that','Though nothing', 'will keep us together', 'We could steal time','Just for one day','this is too long','and that is why','you have no friends']

  $('.questions_wrapper').sortable();

  $('#add_question').on('click',function(event){
    event.preventDefault();
    $.ajax({
      type: 'get',
      url: '/surveys/questions/new'
    }).done(function(q_html){    
      $('.questions_wrapper').append(q_html);
    });
  });

  $('#survey_form').on('click','.remove_question',function(event){
    event.preventDefault();
    $(this).closest('div.question').fadeOut(function(){
      $(this).remove();
    });
  });

  $('#survey_form').on('click','.add_option',function(event){
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

  $('#survey_form').on('click','.hide_options',function(e){
    e.preventDefault();
    var question = $(this).closest('.question');

    var hide_show = $(this).html();

    var direction = 'left';
    question.find('.option').each(function(){
      $(this).toggle('slide',{direction: direction});
      direction = (direction == 'left') ? 'right' : 'left'
    });
    question.find('.question_options').toggle('slide',{direction: direction});
    
    var hide_show = $(this).html();
    console.log(hide_show);
    hide_show = (hide_show == '<i class="icon-arrow-up"></i>Hide Details') ? '<i class="icon-arrow-down"></i>Show Details' : '<i class="icon-arrow-up"></i>Hide Details';
    console.log(hide_show);
    $(this).html(hide_show);

    });

  $('.survey_wrapper').on('click','.remove-survey',function(){
    var self = this;
    var id = parseInt($(this).closest('div.survey').attr('data-id'));
    console.log(id);

    $.ajax({
      url: "/surveys/delete",
      type: "delete",
      data: {id: id}
    }).done(function(){
      $(self).closest('div.survey').fadeOut(function(){
        $(this).remove();
      });
    });

  });

});