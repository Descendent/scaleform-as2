﻿import gfx.controls.Button;
import gfx.core.UIComponent;
import gfx.data.DataProvider;
import gfx.managers.FocusHandler;
import gfx.ui.InputDetails;
import gfx.ui.NavigationCode;
/**
 * The ButtonBar is similar to the ButtonGroup although it has a visual representation. It is also able to create Button instances on the fly based on a DataProvider. The ButtonBar is useful for creating dynamic tab-bar like UI elements.
 
	<b>Inspectable Properties</b>
 	Although the ButtonBar component has no content (represented simply as a small circle on the Stage in Flash Studio), it does contain several inspectable properties. The majority of them deal with the placement settings of the Button instances created by the ButtonBar.<ul>
	<li><i>visible</i>: Hides the ButtonBar if set to false.</li>
	<li><i>disabled</i>: Disables the ButtonBar if set to true.</li>
	<li><i>itemRenderer</i>: Linkage ID of the Button component symbol. This symbol will be instantiated as needed based on the data assigned to the ButtonBar.</li>
	<li><i>direction</i>: Button placement. Horizontal will place the Button instances side-by-side, while vertical will stack them on top of each other.</li>
    <li><i>spacing</i>: The spacing between the Button instances. Affects only the current direction (see direction property).</li>
	<li><i>autoSize</i>: Determines if child buttons will scale to fit the text that it contains and which direction to align the resized buttons. Setting the autoSize property to {@code autoSize="none"} will leave the buttons' current size unchanged.</li>
	<li><i>buttonWidth</i>: Sets a common width to all Button instances. If autoSize is set to true this property is ignored.</li>
	<li><i>enableInitCallback</i>: If set to true, _global.CLIK_loadCallback() will be fired when a component is loaded and _global.CLIK_unloadCallback will be called when the component is unloaded. These methods receive the instance name, target path, and a reference the component as parameters.  _global.CLIK_loadCallback and _global.CLIK_unloadCallback should be overriden from the game engine using GFx FunctionObjects.</li></ul>
	
	<b>States</b>
	The CLIK ButtonBar does not have any visual states because its managed Button components are used to display the group state.
	
	<b>Events</b>
		All event callbacks receive a single Object parameter that contains relevant information about the event. The following properties are common to all events. <ul>
		<li><i>type</i>: The event type.</li>
		<li><i>target</i>: The target that generated the event.</li></ul>
		
	The events generated by the ButtonBar component are listed below. The properties listed next to the event are provided in addition to the common properties.<ul>
	<li><i>show</i>: The component’s visible property has been set to true at runtime.</li>
	<li><i>hide</i>: The component’s visible property has been set to false at runtime.</li>
	<li><i>focusIn</i>: The component has received focus.</li>
	<li><i>focusOut</i>: The component has lost focus.</li>
	<li><i>change</i>: A new button from the group has been selected.</li><ul>
		<li><i>index</i>: The selected index of the ButtonBar. Number type. Values 0 to number of buttons minus 1.</li>
		<li><i>renderer</i>: The selected Button. CLIK Button type.</li>
		<li><i>item</i>: The selected item from the dataProvider. AS2 Object type.</li>
		<li><i>data</i>: The data value of the selected dataProvider item. AS2 Object type.</li></ul></li>
	<li><i>itemClick</i>: A button in the group has been clicked.</li><ul>
		<li><i>index</i>: The ButtonBar index of the Button that was clicked. Number type. Values 0 to number of buttons minus 1. </li>
		<li><i>item</i>: The selected item from the dataProvider. AS2 Object type.</li>
		<li><i>data</i>: The data value of the selected dataProvider item. AS2 Object type.</li>
		<li><i>controllerIdx</i>: The index of the mouse cursor used to generate the event (applicable only for multi-mouse-cursor environments). Number type. Values 0 to 3.</li></ul></li></ul>
 
*/
intrinsic class gfx.controls.ButtonBar extends UIComponent
{
	private var _dataProvider : Object;
	private var _itemRenderer : String;
	private var _spacing : Number;
	private var _direction : String;
	private var _selectedIndex : Number;
	private var _autoSize : String;
	private var _buttonWidth : Number;
	private var _labelField : String;
	private var _labelFunction : Function;
	private var renderers : Array;
	private var reflowing : Boolean;

	public function get disabled() : Boolean;
	public function set disabled(value:Boolean) : Void;

	/**
	 * The list of buttons to display. Unlike list-based components, this is just an Array.  The Array can contain Objects or Strings, and the {@code itemToLabel} method will determine the resulting text label for each button.
	 * @see #itemToLabel
	 */
	public function get dataProvider() : Object;
	public function set dataProvider(value:Object) : Void;

	public function get itemRenderer() : String;
	public function set itemRenderer(value:String) : Void;

	public function get spacing() : Number;
	public function set spacing(value:Number) : Void;

	public function get direction() : String;
	public function set direction(value:String) : Void;

	public function get autoSize() : String;
	public function set autoSize(value:String) : Void;

	public function get buttonWidth() : Number;
	public function set buttonWidth(value:Number) : Void;

	/**
	 * The 0-base index of the selected button. The ButtonBar can have a single selected item in its {@code dataProvider}, represented by the {@code selectedIndex}. When the {@code selectedIndex} changes, a "change" event is dispatched.
	 */
	public function get selectedIndex() : Number;
	public function set selectedIndex(value:Number) : Void;

	/**
	 * The item at the {@code selectedIndex} in the DataProvider.
	 */
	public function get selectedItem() : Object;

	/**
	 * The {@code data} property of the {@code selectedItem}.
	 * @see Button#data
	 */
	public function get data() : Object;

	/**
	 * The name of the field in the {@code dataProvider} model to be displayed as the label for itemRenderers.  A {@code labelFunction} will be used over a {@code labelField} if it is defined.
	 */
	public function get labelField() : String;
	public function set labelField(value:String) : Void;

	/**
	 * The function used to determine the label for itemRenderers. A {@code labelFunction} will override a {@code labelField} if it is defined.
	 */
	public function get labelFunction() : Function;
	public function set labelFunction(value:Function) : Void;


	/**
	 * The constructor is called when a ButtonBar or a sub-class of ButtonBar is instantiated on stage or by using {@code UIComponent.createInstance()} in ActionScript. This component can <b>not</b> be instantiated using {@code new} syntax. When creating new components that extend ButtonBar, ensure that a {@code super()} call is made first in the constructor.
	 */
	public function ButtonBar();

	public function invalidateData() : Void;

	/**
	 * Convert an item to a label string using the {@code labelField} and {@code labelFunction}. If the item is not an object, then it will be converted to a string, and returned.
	 * @param item The item to convert to a label.
	 * @returns The converted label string.
	 * @see #labelField
	 * @see #labelFunction
	 */
	public function itemToLabel(item:Object) : String;

	public function handleInput(details:InputDetails, pathToFocus:Array) : Boolean;

	/** @exclude */
	public function toString() : String;

	private function draw() : Void;

	private function drawLayout() : Boolean;

	private function createRenderer(index:Number) : MovieClip;

	private function handleItemClick(event:Object) : Void;

	private function selectItem(index:Number) : Void;

	private function changeFocus() : Void;

	private function onDataChange(event:Object) : Void;

	private function populateData() : Void;

}