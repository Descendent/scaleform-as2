/**
 * The EventDispatcher manages the notification mechanism used throughout the components. EventDispatcher can be inherited from, or mixed in to add notification capabilities to a class.  The Scaleform EventDispatcher mirrors the API in the Macromedia AS2 EventDispatcher, and the common methods found in the AS3 EventDispatcher, but also includes some enhancements, such as the {@link #removeAllEventListeners()} method.
 */
intrinsic class gfx.events.EventDispatcher
{
	static private var _instance : EventDispatcher;
	private var _listeners : Object;

	/**
	 * Initialize a component or class, adding Event Dispatching capabilities to it.
	 */
	static public function initialize(target:Object) : Void;

	static private function indexOfListener(listeners:Array, scope:Object, callBack:String) : Number;

	/**
	 * Create a new EventDispatcher, which is an Object capable of broadcasting events. It is more likely that the EventDispatcher will be extended, or the static {@code EventDispatcher.initialize()} method will be used to add event-broadcasting capabilities to a component.
	 */
	public function EventDispatcher();

	/**
	 * Subscribe a listener to an event.
	 * @param event The type of event.
	 * @param scope The scope of the listener.
	 * @param callBack The function name to call on the listener.
	 */
	public function addEventListener(event:String, scope:Object, callBack:String) : Void;

	/**
	 * Unsubscribe a listener from an event.
	 * @param event The type of event.
	 * @param scope The scope of the listener.
	 * @param callBack The function name to call on the listener.
	 */
	public function removeEventListener(event:String, scope:Object, callBack:String) : Void;

	/**
	 * Dispatch an event to all listeners.
	 * @param event The event object to dispatch to the listeners.
	 */
	public function dispatchEvent(event:Object) : Void;

	/**
	 * Check if a listener has been added for a specific event type.
	 * @param event The event type
	 * @param scope The scope of the listener.
	 * @param callBack The function name to call on the listener.
	 * @return If the component has a specific listener
	 */
	public function hasEventListener(event:String) : Boolean;

	/**
	 * Unsubscribe all listeners from a specific event, or all events.
	 * @param event The type of event.
	 */
	public function removeAllEventListeners(event:String) : Void;

	private function dispatchQueue(dispatch:Object, event:Object) : Void;

	static private function $dispatchEvent(dispatch:Object, listeners:Array, event:Object);

	/**
	 * Clean up the EventDispatcher instance. The cleanUp method is not used to clean up EventDispatcher sub-classes, and is not mixed-in to components when the static initialize() method is used. Use {@link cleanUpEvents()} instead.
	 */
	public function cleanUp() : Void;

	/**
	 * Clean up the mixed-in EventDispatcher methods in a component.
	 */
	private function cleanUpEvents() : Void;

}