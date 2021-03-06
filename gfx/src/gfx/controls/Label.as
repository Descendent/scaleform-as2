﻿import flash.external.ExternalInterface;
import gfx.core.UIComponent;
import gfx.utils.Constraints;
import gfx.utils.Locale;
/**
 * The CLIK Label component is a noneditable standard textField wrapped by a MovieClip symbol, with a few additional convenient features. Internally, the Label supports the same properties and behaviors as the standard textField, however only a handful of commonly used features are exposed by the component itself. Access to the Label’s actual textField is provided if the user needs to change its properties directly. In certain cases, such as those described below, developers may use the standard textField instead of the Label component.
 
   Since the Label is a MovieClip symbol, it can be embellished with graphical elements, which is not possible with the standard textField. As a symbol, it does not need to be configured per instance like textField instances.  The Label also provides a disabled state that can be defined in the timeline. Whereas, complex AS2 code is required to mimic such behavior with the standard textField. 

   The Label component uses constraints by default, which means resizing a Label instance on the stage will have no visible effect at runtime. If resizing textFields is required, developers should use the standard textField instead of the Label in most cases. In general, if consistent reusability is not a requirement for the text element, the standard textField is a lighter weight alternative than the Label component.

 
	<b>Inspectable Properties</b>
	The inspectable properties of the Label component are:<ul>
	<li><i>text</i>: Sets the text of the Label.</li>
	<li><i>visible</i>: Hides the label if set to false.</li>
	<li><i>disabled</i>: Disables the label if set to true.</li>
	<li><i>autoSize</i>: Determines if the button will scale to fit the text that it contains and which direction to align the resized button. Setting the autoSize property to {@code autoSize="none"} will leave its current size unchanged.</li>
	<li><i>enableInitCallback</i>: If set to true, _global.CLIK_loadCallback() will be fired when a component is loaded and _global.CLIK_unloadCallback will be called when the component is unloaded. These methods receive the instance name, target path, and a reference the component as parameters.  _global.CLIK_loadCallback and _global.CLIK_unloadCallback should be overriden from the game engine using GFx FunctionObjects.</li></ul>
	
	<b>States</b>
	The CLIK Label component supports two states based on the disabled property.<ul>
	<li>A default or enabled state.</li>
	<li>a disabled state.</li></ul>
	
	<b>Events</b>
	All event callbacks receive a single Object parameter that contains relevant information about the event. The following properties are common to all events. <ul>
	<li><i>type</i>: The event type.</li>
	<li><i>target</i>: The target that generated the event.</li></ul>
	
	The events generated by the Label component are listed below. The properties listed next to the event are provided in addition to the common properties.<ul>
	<li><i>show</i>: The component’s visible property has been set to true at runtime.</li>
	<li><i>hide</i>: The component’s visible property has been set to false at runtime.</li>
	<li><i>stateChange</i>: The label’s state has changed.</li><ul>
		<li><i>state</i>: The new label state. String type. Values "default" or "disabled". </li></ul></li></ul>
 */
intrinsic class gfx.controls.Label extends UIComponent
{
	private var _text : String;
	private var _autoSize : String;
	private var constraints : Constraints;
	private var isHtml : Boolean;
	/** A reference to the TextField instance. Note that when state changes are made, the textField instance may change, so changes made to it externally may be lost. */
	public var textField : TextField;

	public function get textID() : String;
	public function set textID(value:String) : Void;

	/**
	 * The text to be displayed by the Label component. This property assumes that localization has been handled externally.
	 * @see #htmlText For formatted text, use the {@code htmlText} property.
	 */
	public function get text() : String;
	public function set text(value:String) : Void;

	/**
	 * The html text to be displayed by the label component.  This property assumes that localization has been handled externally.
	 * @see #text For plain text use {@code text} property.
	 */
	public function get htmlText() : String;
	public function set htmlText(value:String) : Void;

	public function get disabled() : Boolean;
	public function set disabled(value:Boolean) : Void;

	public function get autoSize() : String;
	public function set autoSize(value:String) : Void;


	/**
	 * The constructor is called when a Label or a sub-class of Label is instantiated on stage or by using {@code attachMovie()} in ActionScript. This component can <b>not</b> be instantiated using {@code new} syntax. When creating new components that extend Label, ensure that a {@code super()} call is made first in the constructor.
	 */
	public function Label();

	public function setSize(width:Number, height:Number) : Void;

	/** @exclude */
	public function toString() : String;

	private function configUI() : Void;

	/**
	 * Realigns the component based on the autoSize property.
	 */
	private function alignForAutoSize() : Void;

	private function calculateWidth() : Number;

	private function updateAfterStateChange() : Void;

	private function draw() : Void;

	private function setState() : Void;

}