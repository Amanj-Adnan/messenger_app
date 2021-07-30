import consumer from "./consumer"
import  CableReady from 'cable_ready'

consumer.subscriptions.create("RoomChannel", {
  connected() {
    console.log("hello")
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    if (data.cableReady) CableReady.perform(data.operations)
  }
});
