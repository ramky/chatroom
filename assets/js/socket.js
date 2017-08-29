import {Socket} from "phoenix"

let socket = new Socket("/socket", {params: {token: window.userToken}})

socket.connect()

let channel = socket.channel("lobby", {});
let list    = $('#message-list');
let message = $('#message');
let name    = $('#name');

message.on('keypress', event => {
  if (event.keyCode == 13) {
    channel.push('new_message', { name: name.val(), message: message.val() });
    message.val('');
  }
});

channel.on('new_message', payload => {
  list.append(`<b>${payload.name || 'Anonymous'}:</b> ${payload.message}<br>`);
  list.prop({scrollTop: list.prop("scrollHeight")});
});

channel.join()
  .receive("ok", resp => { console.log("Joined successfully", resp) })
  .receive("error", resp => { console.log("Unable to join", resp) })

export default socket
