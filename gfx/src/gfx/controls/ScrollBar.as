﻿import flash.external.ExternalInterface;
import gfx.controls.Button;
import gfx.controls.ScrollIndicator;
import gfx.utils.Constraints;
/**
 * The CLIK ScrollBar displays and controls the scroll position of another component. It adds interactivity to the ScrollIndicator with a draggable thumb button, as well as optional “up” and “down” arrow buttons, and a clickable track. 
 
	<b>Inspectable Properties</b>
	The inspectable properties of the ScrollBar are similar to ScrollIndicator with one addition:<ul>
	<li><i>scrollTarget</i>: Set a TextArea or normal multiline textField as the scroll target to automatically respond to scroll events. Non-text field types have to manually update the ScrollIndicator properties.</li>
	<li><i>trackMode</i>: When the user clicks on the track with the cursor, the scrollPage setting will cause the thumb to continuously scroll by a page until the cursor is released. The scrollToCursor setting will cause the thumb to immediately jump to the cursor and will also transition the thumb into a dragging mode until the cursor is released.</li>
	<li><i>visible</i>: Hides the component if set to false.</li>
	<li><i>disabled</i>: Disables the component if set to true.</li>
	<li><i>offsetTop</i>: Thumb offset at the top. A positive value moves the thumb's top-most position higher.</li>
	<li><i>offsetBottom</i>: Thumb offset at the bottom. A positive value moves the thumb's bottom-most position lower.</li>
	<li><i>enableInitCallback</i>: If set to true, _global.CLIK_loadCallback() will be fired when a component is loaded and _global.CLIK_unloadCallback will be called when the component is unloaded. These methods receive the instance name, target path, and a reference the component as parameters.  _global.CLIK_loadCallback and _global.CLIK_unloadCallback should be overriden from the game engine using GFx FunctionObjects.</li>
	<li><i>soundMap</i>: Mapping between events and sound process. When an event is fired, the associated sound process will be fired via _global.gfxProcessSound, which should be overriden from the game engine using GFx FunctionObjects.</li></ul>
	
	<b>States</b>
	The ScrollBar, similar to the ScrollIndicator, does not have explicit states. It uses the states of its child elements, the thumb, up, down and track Button components.
	
	<b>Events</b>
	All event callbacks receive a single Object parameter that contains relevant information about the event. The following properties are common to all events. <ul>
	<li><i>type</i>: The event type.</li>
	<li><i>target</i>: The target that generated the event.</li></ul>
		
	The events generated by the ScrollBar component are listed below. The properties listed next to the event are provided in addition to the common properties.<ul>
	<li><i>show</i>: The component’s visible property has been set to true at runtime.</li>
	<li><i>hide</i>: The component’s visible property has been set to false at runtime.</li>
	<li><i>scroll</i>: The scroll position has changed.<ul>
		<li><i>position</i>: The new scroll position. Number type. Values minimum position to maximum position. </li></ul></li></ul>
*/
intrinsic class gfx.controls.ScrollBar extends ScrollIndicator
{
	/** The number of positions to scroll when the track is clicked in scrollPage mode */
	public var trackScrollPageSize : Number;
	private var dragOffset : Object;
	private var constraints : Constraints;
	private var _trackMode : String;
	private var trackScrollPosition : Number;
	private var trackDragMouseIndex : Number;
	/** A reference to the up arrow symbol in the ScrollBar, used to decrement the scroll position. */
	public var upArrow : Button;
	/** A reference to the down arrow symbol in the ScrollBar, used to increment the scroll position. */
	public var downArrow : Button;
	/** A reference to the thumb symbol in the ScrollBar, used to display the scrollPosition, as well as change it by dragging. */
	public var thumb : Button;
	/** A reference to the track symbol in the ScrollBar, used to determine the thumb's range, as well as jump to a position when clicked. */
	public var track : Button;

	public function get disabled() : Boolean;
	public function set disabled(value:Boolean) : Void;

	/** 
	 * Set the scroll position to a number between the minimum and maximum.
	 */
	public function get position() : Number;
	public function set position(value:Number) : Void;

	public function get trackMode() : String;
	public function set trackMode(value:String) : Void;

	/** @exclude */
	public function get availableHeight() : Number;


	/**
	 * The constructor is called when a ScrollBar or a sub-class of ScrollBar is instantiated on stage or by using {@code attachMovie()} in ActionScript. This component can <b>not</b> be instantiated using {@code new} syntax. When creating new components that extend ScrollBar, ensure that a {@code super()} call is made first in the constructor.
	 */
	public function ScrollBar();

	/** @exclude */
	public function toString() : String;

	private function configUI() : Void;

	private function draw() : Void;

	private function updateThumb() : Void;

	private function scrollUp() : Void;

	private function scrollDown() : Void;

	private function beginDrag() : Void;

	private function doDrag() : Void;

	private function endDrag() : Void;

	private function beginTrackScroll(e:Object) : Void;

	private function trackScroll() : Void;

	private function updateScrollTarget() : Void;

	private function scrollWheel(delta:Number) : Void;

}