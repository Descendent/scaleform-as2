﻿import flash.external.ExternalInterface;
import gfx.core.UIComponent;
import gfx.controls.Button;
import gfx.data.DataProvider;
import gfx.ui.InputDetails;
import gfx.ui.NavigationCode;
import gfx.utils.Constraints;
/**
 * The OptionStepper component, similar to the NumericStepper, displays a single value, but is capable of displaying more than just numbers. It uses a DataProvider instance to query for the current value, therefore is able to support an arbitrary number of elements of different types. The dataProvider is assigned via code, as shown in the example  below:
<i>optionStepper.dataProvider = [“item1”, “item2”, “item3”, “item4”, “item5”];</i>
 
	<b>Inspectable Properties</b>
	A MovieClip that derives from the OptionStepper component will have the following inspectable properties:<ul>
	<li><i>visible</i>: Hides the component if set to false.</li>
	<li><i>disabled</i>: Disables the component if set to true.</li>
	<li><i>enableInitCallback</i>: If set to true, _global.CLIK_loadCallback() will be fired when a component is loaded and _global.CLIK_unloadCallback will be called when the component is unloaded. These methods receive the instance name, target path, and a reference the component as parameters.  _global.CLIK_loadCallback and _global.CLIK_unloadCallback should be overriden from the game engine using GFx FunctionObjects.</li>
	<li><i>soundMap</i>: Mapping between events and sound process. When an event is fired, the associated sound process will be fired via _global.gfxProcessSound, which should be overriden from the game engine using GFx FunctionObjects.</li></ul>
	
	<b>States</b>
	The OptionStepper component supports three states based on its focused and disabled properties. <ul>
	<li>default or enabled state.</li>
	<li>focused state, that highlights the textField area.</li>
	<li>disabled state.</li></ul>
	
	<b>Events</b>
	All event callbacks receive a single Object parameter that contains relevant information about the event. The following properties are common to all events. <ul>
	<li><i>type</i>: The event type.</li>
	<li><i>target</i>: The target that generated the event.</li></ul>
	
	The events generated by the OptionStepper component are listed below. The properties listed next to the event are provided in addition to the common properties.<ul>
	<li><i>show</i>: The component's visible property has been set to true at runtime.</li>
	<li><i>hide</i>: The component's visible property has been set to false at runtime.</li>
	<li><i>change</i>: The OptionStepper’s value has changed.</li>
	<li><i>stateChange</i>: The OptionStepper’s focused or disabled property has changed.<ul>
		<li><i>state</i>: Name of the new state. String type. Values "default", "focused" or "disabled".</li></ul></li></ul>
 */
intrinsic class gfx.controls.OptionStepper extends UIComponent
{
	/** A reference to the currently selected item in the dataProvider. */
	public var selectedItem : Object;
	public var soundMap : Object;
	private var _dataProvider : Object;
	private var _selectedIndex : Number;
	private var _labelField : String;
	private var _labelFunction : Function;
	private var constraints : Constraints;
	/** A reference to the textField instance used to display the selected item's label. Note that when state changes are made, the textField instance may change, so changes made to it externally may be lost. */
	public var textField : TextField;
	/** A reference to the next button instance used to increment the {@code selectedIndex}. */
	public var nextBtn : Button;
	/** A reference to the previous button instance used to decrement the {@code selectedIndex}. */
	public var prevBtn : Button;

	public function get disabled() : Boolean;
	public function set disabled(value:Boolean) : Void;

	/**
	 * The data model displayed in the component. The dataProvider can be an Array or any object exposing the appropriate API, defined in the {@code IDataProvider} interface. If an Array is set as the dataProvider, functionality will be mixed into it by the {@code DataProvider.initialize} method. When a new DataProvider is set, the {@code selectedIndex} property will be reset to 0.
	 * @see DataProvider#initialize
	 * @see IDataProvider
	 */
	public function get dataProvider() : Object;
	public function set dataProvider(value:Object) : Void;

	/**
	 * The index of the item in the {@code dataProvider} that is selected in a single-selection list.
	 */
	public function get selectedIndex() : Number;
	public function set selectedIndex(value:Number) : Void;

	/**
	 * The name of the field in the {@code dataProvider} model to be displayed as the label in the TextInput field.  A {@code labelFunction} will be used over a {@code labelField} if it is defined.
	 * @see #itemToLabel
	 */
	public function get labelField() : String;
	public function set labelField(value:String) : Void;

	/**
	 * The function used to determine the label for an item. A {@code labelFunction} will override a {@code labelField} if it is defined.
	 * @see #itemToLabel
	 */
	public function get labelFunction() : Function;
	public function set labelFunction(value:Function) : Void;


	/**
	 * The constructor is called when a OptionStepper or a sub-class of OptionStepper is instantiated on stage or by using {@code attachMovie()} in ActionScript. This component can <b>not</b> be instantiated using {@code new} syntax. When creating new components that extend OptionStepper, ensure that a {@code super()} call is made first in the constructor.
	 */
	public function OptionStepper();

	/**
	 * Convert an item to a label string using the {@code labelField} and {@code labelFunction}.
	 * @param item The item to convert to a label.
	 * @returns The converted label string.
	 * @see #labelField
	 * @see #labelFunction
	 */
	public function itemToLabel(item:Object) : String;

	/**
	 * The current data has become invalid, either by a data change, or a display change.
	 */
	public function invalidateData() : Void;

	public function handleInput(details:InputDetails, pathToFocus:Array) : Boolean;

	/** @exclude */
	public function toString() : String;

	private function configUI() : Void;

	private function draw() : Void;

	private function changeFocus() : Void;

	private function updateAfterStateChange() : Void;

	private function updateLabel() : Void;

	private function updateSelectedItem() : Void;

	private function populateText(item:Object) : Void;

	private function onNext(evtObj:Object) : Void;

	private function onPrev(evtObj:Object) : Void;

	private function onDataChange(event:Object) : Void;

}