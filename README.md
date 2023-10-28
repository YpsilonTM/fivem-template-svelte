# FiveM Svelte Template

This template should help get you started developing with Svelte in FiveM.

## NUI Functions

This module contains three functions for working with the FiveM NUI (Native UI) system in Svelte applications:

- `NUIRequest`: Sends a request to the FiveM client with the specified event name and data, and returns a Promise that resolves with the response data from the client.
- `NUIEvent`: Registers an event listener for a specific NUI action, and calls a handler function when the action is received.
- `RegisterKeyMapping`: Registers a key mapping with a handler function to be called when the specified keys are pressed.

For more information on how to use these functions, see the JSDoc comments in `nui.ts`.
