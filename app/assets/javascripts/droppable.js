function dragover_handler(ev) {
 ev.preventDefault();
 // Set the dropEffect to move
 ev.dataTransfer.dropEffect = "move"
}

function drop_handler(ev) {
 ev.preventDefault();
 // Get the id of the target and add the moved element to the target's DOM
 var data = ev.dataTransfer.getData("text");
 ev.target.appendChild(document.getElementById(data));
 update_messenger()
}

function update_messenger() {
  $messenger_container = $(".messenger-messages");
  messenger_id = $messenger_container.attr('id').split('-').pop();
  messages = [];
  $messenger_container.children().each(function(i, v) { 
      messages.push($(v).attr('id'));
  });

  $.ajax({
    type: 'PUT',
    url: messenger_id,
    data: {messages_id: messages}
  }).done(function(msg) {
    console.log("Updated!")
  })
}