// $(document).ready(function(){
//     $('td').hover(function() {
//       $(this).css('background-color', 'white');

//     });

//     $('td').mouseleave(function(){
//       $(this).css('background-color', 'black');

//     });

// });



$(document).ready(function(){
    $("#input_URL").submit(function(event){
      event.preventDefault();
      $.ajax({
        method: "post",
        url: "/urls",
        dataType: "JSON",
        data: $(this).serialize(),
        success:function(data){
          alert("shorten successful");
          debugger
          $("#abc").append("<tr>"+
            "<td>" + data.long_url + "</td>" +
            "<td>" +  "<form id='shortener' action='<%= url.short_url%>' method='get' >" +
            "<input type='submit' value='"+ data.short_url + "'>" + "</td>" + "</form>" +
            "<td>" + "<form id='delete' action='/<%=url.id%>/delete' method='post'>" +
            "<input type='submit' value='Delete'>" +
            "</form>" + "</td>" +
            "<td>" + data.click_count + "</td>" +
            "</tr>");
        },

        error:function(data){
          alert("error");
          // $("#error").html("error!!!");

        }
      });
    });
});

