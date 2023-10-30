import axios from 'axios'
import { onDestroy, onMount } from 'svelte'

const resourceName = (window as any).GetParentResourceName ? (window as any).GetParentResourceName() : 'nui-frame-app'

/**
 * Sends a request to the fivem client with the specified event name and data.
 * @param eventname - The name of the event to send the request to.
 * @param data - The data to send along with the request.
 * @returns A Promise that resolves with the response data from the fivem client.
 */

const NUIRequest = async (eventname: string, data: any = {}) => {
  try {
    const response = await axios.post(`https://${resourceName}/${eventname}`, data)
    return response.data
  } catch (error) {
    console.log(error)
  }
}

/**
 * Registers an event listener for a specific NUI action.
 * @param actionName - The name of the NUI action to listen for. When sending an NUI request in the fivem client, for the data define an action property with the same name as this parameter.
 * @param handler - The function to be called when the NUI action is received.
 */
const NUIEvent = (actionName: string, handler: (data: any) => void) => {
  const eventlistener = (event: MessageEvent) => {
    const { action, data } = event.data
    if (action === actionName) {
      handler(data)
    }
  }
  onMount(() => window.addEventListener('message', eventlistener))
  onDestroy(() => window.removeEventListener('message', eventlistener))
}

/**
 * Registers a key mapping with a handler function to be called when the specified keys are pressed.
 * @param keys - An array of strings representing the keys to listen for. Find the key names here: https://developer.mozilla.org/en-US/docs/Web/API/UI_Events/Keyboard_event_key_values
 * @param handler - A function to be called when the specified keys are pressed.
 */
const RegisterKeyMapping = (keys: string[], handler: (event: KeyboardEvent) => void) => {
  const keylistener = (event: KeyboardEvent) => {
    if (keys.includes(event.key)) {
      handler(event)
    }
  }
  onMount(() => window.addEventListener('keydown', keylistener))
  onDestroy(() => window.removeEventListener('keydown', keylistener))
}

export { NUIEvent, NUIRequest, RegisterKeyMapping }
