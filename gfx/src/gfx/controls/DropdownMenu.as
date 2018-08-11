import flash.external.ExternalInterface;
import gfx.controls.Button;
import gfx.controls.CoreList;
import gfx.data.DataProvider;
import gfx.managers.PopUpManager;
import gfx.ui.InputDetails;
import gfx.ui.NavigationCode;
import gfx.utils.Constraints;
import flash.geom.Point;
/**
 * The DropdownMenu wraps the behavior of a button and a list. Clicking on this component opens a list that contains the elements to be selected. The DropdownMenu displays only the selected element in its idle state. It can be configured to use either the ScrollingList or the TileList, to which either a ScrollBar or ScrollIndicator can be paired with. The list is populated via an installed DataProvider. The DropdownMenu’s list element is populated via a DataProvider. The dataProvider is assigned via code, as shown in the example below:
<i>dropdownMenu.dataProvider = ["item1", "item2", "item3", "item4"];</i>

	<b>Inspectable Properties</b>
	The inspectable properties of the DropdownMenu component are:<ul>
	<li><i>visible</i>: Hides the component if set to false.</li>
	<li><i>disabled</i>: Disables the component if set to true.</li>
	<li><i>dropdown</i>: Symbol name of the list component (ScrollingList or TileList) to use with the DropdownMenu component.</li>
	<li><i>itemRenderer</i>: Symbol name of the list component's itemRenderer.</li>
	<li><i>dropdownWidth</i>: Width of the dropdown list. If this value is -1, then the DropdownMenu will size the list to the component’s width.</li>
      <li><i>itemRenderer</i>: Symbol name of the dropdown list’s item renderer. Created by the dropdown list instance.</li>
      <li><i>scrollBar</i>: Symbol name of the dropdown list’s scroll bar. Created by the dropdown list instance. If value is empty, then the dropdown list will have no scroll bar.</li>
	<li><i>margin</i>: The margin between the boundary of the list component and the list items created internally. This margin also affects the automatically generated scrollbar.</li>	  
	<li><i>paddingTop:</i>Extra padding at the top for the list items. Does not affect the automatically generated scrollbar.</li>
	<li><i>paddingBottom:</i>Extra padding at the bottom for the list items. Does not affect the automatically generated scrollbar.</li>
	<li><i>paddingLeft:</i>Extra padding on the left side for the list items. Does not affect the automatically generated scrollbar.</li>
	<li><i>paddingRight:</i>Extra padding on the right side for the list items. Does not affect the automatically generated scrollbar.</li>
	<li><i>thumbOffsetTop:</i>Scrollbar thumb top offset. This property has no effect if the list does not automatically create a scrollbar instance.</li>
	<li><i>thumbOffsetBottom:</i>Scrollbar thumb bottom offset. This property has no effect if the list does not automatically create a scrollbar instance.</li>
	<li><i>thumbSizeFactor:</i>Page size factor for the scrollbar thumb. A value greater than 1.0 will increase the thumb size by the given factor. This value has no effect if a scrollbar is not attached to the list.</li>
	<li><i>offsetX:</i>Horizontal offset of the dropdown list from the dropdown button position. A positive value moves the list to the right of the dropdown button horizontal position.</li>
	<li><i>offsetY:</i>Vertical offset of the dropdown list from the dropdown button. A positive value moves the list away from the button.</li>
	<li><i>extent:</i>An extra width offset that can be used in conjunction with offsetX. This value has no effect if the dropdownWidth property is set to a value other than -1.</li>
	<li><i>direction:</i>The list open direction. Valid values are "up" and "down".</li>
	<li><i>enableInitCallback</i>: If set to true, _global.CLIK_loadCallback() will be fired when a component is loaded and _global.CLIK_unloadCallback will be called when the component is unloaded. These methods receive the instance name, target path, and a reference the component as parameters.  _global.CLIK_loadCallback and _global.CLIK_unloadCallback should be overriden from the game engine using GFx FunctionObjects.</li>
	<li><i>soundMap</i>: Mapping between events and sound process. When an event is fired, the associated sound process will be fired via _global.gfxProcessSound, which should be overriden from the game engine using GFx FunctionObjects.</li></ul>
	
	
	<b>States</b>
	The DropdownMenu is toggled when opened, and therefore needs the same states as a ToggleButton or CheckBox that denote the selected state. These states include <ul>
	<li>an up or default state.</li>
	<li>an over state when the mouse cursor is over the component, or when it is focused.</li>
	<li>a down state when the button is pressed.</li>
	<li>a disabled state.</li>
	<li>a selected_up or default state.</li>
	<li>a selected_over state when the mouse cursor is over the component, or when it is focused.</li>
	<li>a selected_down state when the button is pressed.</li>
	<li>a selected_disabled state.</li></ul>

	These are the minimal set of keyframes that should be in a DropdownMenu. The extended set of states and keyframes supported by the Button component, and consequently the DropdownMenu component, are described in the Getting Started with CLIK Buttons document.	
	
	<b>Events</b>
	All event callbacks receive a single Object parameter that contains relevant information about the event. The following properties are common to all events. <ul>
	<li><i>type</i>: The event type.</li>
	<li><i>target</i>: The target that generated the event.</li></ul>
	
	The events generated by the DropdownMenu component are listed below. They are the same as the Button component with the exception of the change event. The properties listed next to the event are provided in addition to the common properties.<ul>
	<li><i>show</i>: The component's visible property has been set to true at runtime.</li>
	<li><i>hide</i>: The component's visible property has been set to false at runtime.</li>
	<li><i>focusIn</i>: The component has received focus.</li>
	<li><i>focusOut</i>: The component has lost focus.</li>
	<li><i>select</i>: The component's selected property has changed.<ul>
		<li><i>selected</i>: The selected property of the Button. Boolean type.</li></ul></li>
	<li><i>stateChange</i>: The button's state has changed.<ul>
		<li><i>state</i>: The Button's new state. String type. Values "up", "over", "down", etc. </li></ul></li>
	<li><i>rollOver</i>: The mouse cursor has rolled over the button.<ul>
		<li><i>controllerIdx</i>: The index of the mouse cursor used to generate the event (applicable only for multi-mouse-cursor environments). Number type. Values 0 to 3.</li></ul></li>
	<li><i>rollOut</i>: The mouse cursor has rolled out of the button.<ul>
		<li><i>controllerIdx</i>: The index of the mouse cursor used to generate the event (applicable only for multi-mouse-cursor environments). Number type. Values 0 to 3.</li></ul></li>
	<li><i>press</i>: The button has been pressed.<ul>
		<li><i>controllerIdx</i>: The index of the mouse cursor used to generate the event (applicable only for multi-mouse-cursor environments). Number type. Values 0 to 3.</li></ul></li>
	<li><i>doubleClick</i>: The button has been double clicked. Only fired when the {@link Button.doubleClickEnabled} property is set.<ul>
		<li><i>controllerIdx</i>: The index of the mouse cursor used to generate the event (applicable only for multi-mouse-cursor environments). Number type. Values 0 to 3.</li></ul></li>
	<li><i>click</i>: The button has been clicked.<ul>
		<li><i>controllerIdx</i>: The index of the mouse cursor used to generate the event (applicable only for multi-mouse-cursor environments). Number type. Values 0 to 3.</li></ul></li>
	<li><i>dragOver</i>: The mouse cursor has been dragged over the button (while the left mouse button is pressed).<ul>
		<li><i>controllerIdx</i>: The index of the mouse cursor used to generate the event (applicable only for multi-mouse-cursor environments). Number type. Values 0 to 3.</li></ul></li>
	<li><i>dragOut</i>: The mouse cursor has been dragged out of the button (while the left mouse button is pressed).<ul>
		<li><i>controllerIdx</i>: The index of the mouse cursor used to generate the event (applicable only for multi-mouse-cursor environments). Number type. Values 0 to 3.</li></ul></li>
	<li><i>releaseOutside</i>: The mouse cursor has been dragged out of the button and the left mouse button has been released.<ul>
		<li><i>controllerIdx</i>: The index of the mouse cursor used to generate the event (applicable only for multi-mouse-cursor environments). Number type. Values 0 to 3.</li></ul></li></ul>
 */
intrinsic class gfx.controls.DropdownMenu extends Button
{
	/** The current visible state of the {@code dropdown} component. When the dropdown is open, it will receive input from the user. */
	public var isOpen : Boolean;
	/** A reference to the currently selected item in the {@code dataProvider}. */
	public var selectedItem : Object;
	public var direction : String;
	public var soundMap : Object;
	private var _dataProvider : Object;
	private var _dropdownWidth : Number;
	private var _rowCount : Number;
	private var _labelField : String;
	private var _labelFunction : Function;
	private var _selectedIndex : Number;
	private var inspectableDropdown : Object;
	private var inspectableItemRenderer : Object;
	private var inspectableScrollBar : Object;
	private var margin : Number;
	private var paddingTop : Number;
	private var paddingBottom : Number;
	private var paddingLeft : Number;
	private var paddingRight : Number;
	private var thumbOffsetTop : Number;
	private var thumbOffsetBottom : Number;
	private var thumbSizeFactor : Number;
	private var offsetX : Number;
	private var offsetY : Number;
	private var extent : Number;
	private var _dropdown : MovieClip;

	/**
	 * Sets the class or instance to use as a dropdown. If a linkage ID is specified, it will be created using the {@code PopUpManager}.  The dropdown property will return the persistent MovieClip instance created or referenced by the DropdownMenu so properties can be set on it directly.
	 * @see PopUpManager
	 */
	public function get dropdown() : Object;
	public function set dropdown(value:Object) : Void;

	/**
	 * Sets the linkage ID to use as the dropdown's item renderer, which will be created by the dropdown list component.
	 */
	public function get itemRenderer() : Object;
	public function set itemRenderer(value:Object) : Void;

	/**
	 * Sets the class or instance to use as the dropdown's scrollbar. If a linkage ID is specified, it will be created by the dropdown list component.  The scrollbar property will return the persistent MovieClip instance created or referenced by the DropdownMenu's list so properties can be set on it directly.
	 */
	public function get scrollBar() : Object;
	public function set scrollBar(value:Object) : Void;

	public function get dropdownWidth() : Number;
	public function set dropdownWidth(value:Number) : Void;

	/** 
	 * The number of rows to display in the dropdown. The {@code autoRowCount} property on the dropdown determines how that property is applied. If the length of the {@code dataProvider} is less than the rowCount, only the number of items in the dataProvider will be displayed.
	 */
	public function get rowCount() : Number;
	public function set rowCount(value:Number) : Void;

	/**
	 * The data model displayed in the component. The dataProvider can be an Array or any object exposing the appropriate API, defined in the {@code IDataProvider} interface. If an Array is set as the {@code dataProvider}, functionality will be mixed into it by the {@code DataProvider.initialize} method. When a new DataProvider is set, the {@code selectedIndex} property will be reset to 0.
	 * @see DataProvider
	 * @see IDataProvider
	 */
	public function get dataProvider() : Object;
	public function set dataProvider(value:Object) : Void;

	/**
	 * The index of the item that is selected in a single-selection list. The DropdownMenu will always have a {@code selectedIndex} of 0 or greater, unless there is no data.
	 */
	public function get selectedIndex() : Number;
	public function set selectedIndex(value:Number) : Void;

	/**
	 * The name of the field in the {@code dataProvider} to be displayed as the label for the TextInput field.  A {@code labelFunction}  will be used over a {@code labelField} if it is defined.
	 * @see #itemToLabel()
	 */
	public function get labelField() : String;
	public function set labelField(value:String) : Void;

	/**
	 * The function used to determine the label for an item. A {@code labelFunction} will override a {@code labelField} if it is defined.
	 * @see #itemToLabel()
	 */
	public function get labelFunction() : Function;
	public function set labelFunction(value:Function) : Void;


	/**
	 * The constructor is called when a DropdownMenu or a sub-class of DropdownMenu is instantiated on stage or by using {@code attachMovie()} in ActionScript. This component can <b>not</b> be instantiated using {@code new} syntax. When creating new components that extend DropdownMenu, ensure that a {@code super()} call is made first in the constructor.
	 */
	public function DropdownMenu();

	/**
	 * Convert an item to a label string using the {@code labelField} and {@code labelFunction}.
	 * @param item The item to convert to a label.
	 * @returns The converted label string.
	 * @see #labelField
	 * @see #labelFunction
	 */
	public function itemToLabel(item:Object) : String;

	/**
	 * Open the dropdown list. The {@code selected} and {@code isOpen} properties of the DropdownMenu are set to {@code true} when open. Input will be passed to the dropdown when it is open before it is handled by the DropdownMenu.
	 */
	public function open() : Void;

	/**
	 * Close the dropdown list. The list is not destroyed, the {@code visible} property is set to {@code false}. The {@code selected} property of the DropdownMenu is set to {@code false} when closed.
	 */
	public function close() : Void;

	/**
	 * The current data has become invalid, usually via a data change. The component requests a data update from the {@code dataProvider}.
	 */
	public function invalidateData() : Void;

	public function setSize(width:Number, height:Number) : Void;

	public function handleInput(details:InputDetails, pathToFocus:Array) : Boolean;

	/** @exclude */
	public function removeMovieClip() : Void;

	/** @exclude */
	public function toString() : String;

	private function createDropDown() : Void;

	private function openImpl() : Void;

	private function configUI() : Void;

	private function changeFocus() : Void;

	private function updateSelectedItem() : Void;

	private function updateLabel() : Void;

	private function populateText(item:Object) : Void;

	private function handleChange(event:Object) : Void;

	private function onDataChange(event:Object) : Void;

	private function toggleMenu(event:Object) : Void;

	private function handleStageClick(event:Object) : Void;

	private function hitTest(x:Number, y:Number, shapeFlag:Boolean) : Boolean;

}