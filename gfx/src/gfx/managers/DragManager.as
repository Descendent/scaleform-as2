import gfx.events.EventDispatcher;
import gfx.managers.InputDelegate;
import gfx.managers.PopUpManager;
import gfx.utils.Delegate;
/**
 * Singleton class providing methods to initiate and manage drag and drop operations. Used by DragTarget, InventorySlot, and ItemSlot components.
 
  <b>Events</b><ul>
  	<li><i>dragEnd</i>: Dispatched when a drag operation ends, either because the mouse was released, or because cancelDrag was called. The event object includes the following properties:<ul>
  		<li><i>cancelled</i>: indicates whether the drag was ended by calling cancelDrag</li>
  		<li><i>data</i>: the data associated with the drag operation</li>
  		<li><i>dropTarget</i>: the current drop target (ie. what is currently dragged over)</li></ul></li>
 	<li><i>dragBegin</i>: Dispatched when a drag operation begins. Includes the following properties:<ul>
  		<li><i>data</i>: the data associated with the drag operation</li></ul></li></ul>
 */
intrinsic class gfx.managers.DragManager extends EventDispatcher
{
	static private var _instance : DragManager;
	/**
	 * Indicates whether the target will be removed when the drag finishes. This is automatically set to true when using a linkageID for the target parameter of a startDrag operation, and false otherwise. You can override this default value after calling startDrag. For example, you may want to do this so that you can animate the avatar back into position.
	 */
	public var removeTarget : Boolean;
	/**
	 * Specifies the x offset of the drag target from the cursor position. This is automatically set to true when calling startDrag. You can override this default value after calling startDrag. You may wish to call update() after setting this value to immediately update the target's position.
	 */
	public var dragOffsetX : Number;
	/**
	 * Specifies the y offset of the drag target from the cursor position. This is automatically set to true when calling startDrag. You can override this default value after calling startDrag. You may wish to call update() after setting this value to immediately update the target's position.
	 */
	public var dragOffsetY : Number;
	/**
	 * Indicates the key code that will cancel a drag. Set to 0 to disable.
	 */
	public var cancelKeyCode : Number;
	/**
	 * Indicates the current drop target for the drag.
	 */
	public var dropTarget : Object;
	/**
	 * Arbitrary data to associate with this drag operation. This is usually used to reference the object the drag originated from.
	 */
	public var relatedObject : Object;
	private var _inDrag : Boolean;
	private var _data : Object;
	private var _target : MovieClip;
	private var eventProvider : MovieClip;
	private var dragProps : Object;
	private var pressOrigin : MovieClip;
	private var pressOriginTrackAsMenu : Boolean;
	private var leftBound : Number;
	private var rightBound : Number;
	private var topBound : Number;
	private var bottomBound : Number;

	/**
	 * Returns a reference to the DragManager instance.
	 */
	static public function get instance() : DragManager;

	/** Indicates whether there is an active drag operation. */
	public function get inDrag() : Boolean;

	/** Returns the data associated with the currently active drag operation, or null if there is not an active drag. */
	public function get data() : Object;

	/** Returns the target (avatar) of the currently active drag operation, or null if there is not an active drag. */
	public function get target() : MovieClip;


	/**
	 * Create a new DragManager instance. This method should only be called internally by the DragManager class, as the implementation is a Singleton.
	 */
	private function DragManager();

	/**
	 * Starts a drag operation. This will automatically call initiateDrag to notify any drag listeners.
	 *
	 * @param pressOrigin The MovieClip that was pressed to begin this drag. In order for drags to work correctly, the press origin must have its trackAsMenu property set to true. This optional parameter allows DragManager to set this property, and revert it when the drag ends.
	 * @param avatar A movie clip reference or a linkage string to use as the avatar to drag. If a string is specified DragManager will attempt to instantiate the avatar in the reserved clip on the _root so that it appears over top of all UI elements. If null is specified, no avatar will be used.
	 * @param data Data representing the object being dragged. This will be included with all events associated with this drag, and is accessible during the drag via the .data property.
	 * @param relatedObject Arbitrary data to associate with this drag operation. This is usually used to reference the object the drag originated from.
	 * @param alignmentTarget A MovieClip to base initial position on. For example passing in the icon instance that was clicked to initiate the drag would position the avatar in the same position.
	 * @param lockCenter Locks the drag target's origin to the cursor position.
	 * @param bounds (optional) Object containing drag constraints for the target using in the target's parent's coordinates. Can contain "left", "right", "bottom", and "top" properties for drag bounds. If any bound property is undefined, it will default to have no boundary.
	 *
	 * @returns The target clip that will be dragged, this is either the reference passed in as the target parameter, the clip that was instantiated from the specified linkage id, or null.
	 */
	public function startDrag(pressOrigin:MovieClip, avatar:Object, data:Object, relatedObject:Object, alignmentTarget:MovieClip, lockCenter:Boolean, bounds:Object) : MovieClip;

	/**
	 * Stops an active drag operation, and dispatches the "endDrag" event with the cancelled flag set to false. This method can be used with drag operations initiated by both startDrag and initiateDrag.
	 */
	public function stopDrag() : Void;

	/**
	 * Sets the data and inDrag properties, and dispatches the "dragBegin" event. This method is useful for if you want to utilize custom drag logic, but still take advantage of DragManager's events.
	 *
	 * @param data Data representing the object being dragged. This will be included with all events associated with this drag, and is accessible during the drag via the .data property.
	 * @param relatedObject Arbitrary data to associate with this drag operation. This is usually used to reference the object the drag originated from.
	 */
	public function initiateDrag(data:Object, relatedObject:Object) : Void;

	/**
	 * Stops an active drag operation, and dispatches the "dragEnd" event with the cancelled flag set to true. The cancel flag indicates to listeners that they should not act on the drop.
	 */
	public function cancelDrag() : Void;

	/**
	 * Repositions the drag target relative to the cursor position. Useful if you manually adjust the dragOffset properties and want to immediately updat the target position.
	 */
	public function update() : Void;

	private function doDrag() : Void;

	private function finishDrag(cancelled:Boolean) : Void;

	private function cleanUp() : Void;

	private function handleInput(event:Object) : Void;

}