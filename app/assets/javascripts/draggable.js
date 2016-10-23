function dragstart_handler(ev) {
  console.log("dragStart");
  // Add the target element's id to the data transfer object
  var img = new Image();
  img.src = $(ev.target.children).find('img').attr('src')
  ev.dataTransfer.setDragImage(img, 10, 10)
  ev.dataTransfer.setData("text/plain", ev.target.id);
}