(function() {
  var token = ""  // replace with your api token
  var today = new Date, nextWeek = new Date;
  city = '', state = '';
  // Or for just one location:
  // var city = 'Minneapolis', state = 'MN';
  nextWeek = formatDate(nextWeek.setDate(today.getDate() + 7));
  today = formatDate(today);

  $(":button").click(function() {
    setCityState(this.id);

  /*
    url: 'http://www.eventmy.com/api/v1/events',
    url: 'http://www.eventmy.com/api/v1/events/search',
    I'm passing the request through the Sinatra server here, but making the request to the /search endpoint given above works just as well. This method enables me to make the request on the server side without showing the user token.
  */

    $.ajax({
      type: 'GET',
      url: window.location.origin + '/eventmy-api-demo',
      data: {
        token: token,
        start_date: today,
        end_date: nextWeek,
        city: city,
        state: state,
        limit: 11
      },
      success: function(data) {
        renderEvents(data);
      }
    });
  });

  function setCityState(buttonId) {
    switch(buttonId) {
      case 'man': city='Mankato', state='MN'; break;
      case 'minn': city='Minneapolis', state='MN'; break;
      case 'bos': city='Boston', state='MA'; break;
      case 'sf': city='San Francisco', state='CA'; break;
    }
  }
})();

function renderEvents(events) {
  var htmlContainer = document.getElementById('em-events-container');
  var eventsHtml = '';

  for (i in events) {
    eventsHtml += buildDateHtml(events[i]['start']);
    eventsHtml += buildOuterHtml(events[i]['url']);
    eventsHtml += buildImageHtml(events[i]['pic']);
    eventsHtml += buildTitleHtml(events[i]['title']);
    eventsHtml += '</div></div></a>';
  }

  htmlContainer.innerHTML= eventsHtml;
}

function buildOuterHtml(event_url) {
  return "<a href=" + event_url + "><div class='em-event'>";
}

function buildImageHtml(image_url) {
  return "<img class='event-pic' src='" + image_url + "' />";
}

function buildTitleHtml(title) {
  return "<div class='em-title-container'><span class='em-event-title'><h3>" + title + "</h3></span>";
}

function buildDateHtml(date) {
  var html = '', options = { "month": "short", "day": "numeric" };
  var formattedDate = date.format('mmmm m');
  var formattedDay = date.format('dddd');

  html += "<div class='em-date-container'><div class='em-date-weekday'>" + formattedDay + "</div><div class='em-date'>" + formattedDate + "</div></div>";

  return html;
}

function formatDate(date, options) {
  var d = new Date(date);
  return d.toLocaleDateString('en', options);
}
