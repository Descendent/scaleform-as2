/**
 * This class defines all the event types as constants to enable developers to add type-safe events to the components. The component framework does not use the constants, as the string equivalents are slightly faster to use, and it has been tested extensively. It is recommended that developers using the component framework use the EventType class to listen for events.
 *
 * {@code component.addEventListener(EventTypes.CLICK, this, "handleMouseClick");}
 */
intrinsic class gfx.events.EventTypes
{
	/** The mouse has been clicked on a button-type component. Click events are also dispatched when an "enter" navigation equivalent has been input. */
	static public var CLICK : String;
	/** The mouse has been double-clicked on a button-type component. */
	static public var DOUBLE_CLICK : String;
	/** The mouse has been rolled over a button-type component. */
	static public var ROLL_OVER : String;
	/** The mouse has been pressed on a button-type component. */
	static public var PRESS : String;
	/** The mouse has been rolled out of a button-type component. */
	static public var ROLL_OUT : String;
	/** The mouse has been depressed outside of a button-type component. */
	static public var RELEASE_OUTSIDE : String;
	/** The mouse has been clicked on a button-type component inside of a composite component, such as {@link ScrollingList}. */
	static public var ITEM_CLICK : String;
	/** The mouse has been double-clicked on a button-type component inside of a composite component, such as {@link ScrollingList}. */
	static public var ITEM_DOUBLE_CLICK : String;
	/** The mouse has been rolled over a button-type component inside of a composite component, such as {@link ScrollingList}. */
	static public var ITEM_ROLL_OVER : String;
	/** The mouse has been pressed on button-type component inside of a composite component, such as {@link ScrollingList}. */
	static public var ITEM_PRESS : String;
	/** The mouse has been rolled out of a button-type component inside of a composite component, such as {@link ScrollingList}. */
	static public var ITEM_ROLL_OUT : String;
	/** Stage focus has been given to a UIComponent. */
	static public var FOCUS_IN : String;
	/** Stage focus has taken from a UIComponent. */
	static public var FOCUS_OUT : String;
	/** The {@code visible} property of a UIComponent has been set from {@code false} to {@code true}. */
	static public var SHOW : String;
	/** The {@code visible} property of a UIComponent has been set from {@code true} to {@code false}. */
	static public var HIDE : String;
	/** A component has become initialized. An initialization event is not dispatched from any components by default, but is available to be used when extending or creating components. */
	static public var INIT : String;
	/** The value of a component has changed. Many components dispatch a "change" event when interacted with, such as changing the {@link ScrollingList#selectedIndex} or a {@link Slider#value}. */
	static public var CHANGE : String;
	/** The frame state of a component has changed. Components that use keyframes for states, such as {@link Button} will dispatch a "stateChange" event when interacted with by the user. */
	static public var STATE_CHANGE : String;
	/** A {@link Button#selected Button} component's {@code selected} property has changed. */
	static public var SELECT : String;
	/** A load operation has failed due to an incorrect path name or missing file. Used by {@link UILoader}. */
	static public var IO_ERROR : String;
	/** A load operation has loaded a percentage of the overall total. Typically used by {@link ProgressBar} and {@code UILoader}. */
	static public var PROGRESS : String;
	/** A load operation has completed. Typically used by {@link ProgressBar} and {@code UILoader}. */
	static public var COMPLETE : String;
	/** The scroll position of a component has changed. Used by {@link ScrollIndicator}, as well as list-based components such as {@link ScrollingList}. */
	static public var SCROLL : String;
	/** The text of a component has changed, usually from user input. Typically used by {@link TextInput} and {@link TextArea}. */
	static public var TEXT_CHANGE : String;
	/** The user or game has inputted data, usually through a controller or keyboard. {@link InputDelegate} intercepts input from the game and dispatches these events. */
	static public var INPUT : String;
	/** A component has begun a drag using the {@link DragManager}. */
	static public var DRAG_BEGIN : String;
	/** A drag operation by the {@link DragManager} has completed. */
	static public var DRAG_END : String;
	/** A drag operation has completed, and a component is the target of the drop. */
	static public var DROP : String;

}