import flash.external.ExternalInterface;
import flash.geom.Rectangle;
import gfx.events.EventDispatcher;
import gfx.managers.FocusHandler;
import gfx.managers.InputDelegate;
import gfx.ui.InputDetails;
import System.capabilities;
/**
 * The UIComponent is the basis for all components in the Scaleform framework. It contains functionality found in all components such as initialization, focus management, invalidation, sizing, and events.
 *
 */
intrinsic class gfx.core.UIComponent extends MovieClip
{
	/** The container or related component that should receive actual focus when this component is given focus. */
	public var focusTarget : Object;
	/** Indicates if the component has been complete loaded. */
	public var initialized : Boolean;
	public var enableInitCallback : Boolean;
	public var soundMap : Object;
	private var invalidationIntervalID : Number;
	private var __width : Number;
	private var __height : Number;
	private var _disabled : Boolean;
	private var _focused : Number;
	private var _displayFocus : Boolean;
	private var focusHandlerReference : FocusHandler;
	private var sizeIsInvalid : Boolean;
	/** Mixed in from {@link EventDispatcher#addEventListener EventDispatcher} */
	public var addEventListener : Function;
	/** Mixed in from {@link EventDispatcher#removeEventListener EventDispatcher} */
	public var removeEventListener : Function;
	/** Mixed in from {@link EventDispatcher#hasEventListener EventDispatcher} */
	public var hasEventListener : Function;
	/** Mixed in from {@link EventDispatcher#removeAllEventListeners EventDispatcher} */
	public var removeAllEventListeners : Function;
	/** Mixed in from {@link EventDispatcher#cleanUpEvents EventDispatcher} */
	private var cleanUpEvents : Function;
	/** Mixed in from {@link EventDispatcher#dispatchEvent EventDispatcher} */
	private var dispatchEvent : Function;

	public function get disabled() : Boolean;
	public function set disabled(value:Boolean) : Void;

	public function get visible() : Boolean;
	public function set visible(value:Boolean) : Void;

	/**
	 * Gets and sets the width of the component using internal sizing mechanisms. Use this instead of {@code _width}.  Use {@link setSize()} to set both the width and the height at the same time.
	 */
	public function get width() : Number;
	public function set width(value:Number) : Void;

	/**
	 * Gets and sets the height of the component using internal sizing mechanisms. Use this instead of {@code _height}.  Use {@link setSize()} to set both the width and the height at the same time.
	 */
	public function get height() : Number;
	public function set height(value:Number) : Void;

	/**
	 * Get and set the focus of the component.  This property is explicitly called by the FocusHandler When the stage or application focus is given to this component, but can also be set manually on the component to set or clear focus.  Currently, an application can have only a single focus. When the focus on a component changes, a "focusIn" or "focusOut" event is fired.
	 */
	public function get focused() : Number;
	public function set focused(value:Number) : Void;

	/**
	 * Set the component to display itself as focused, even if it is not.  This property is used by container components to make them appear focused.
	 */
	public function get displayFocus() : Boolean;
	public function set displayFocus(value:Boolean) : Void;


	/**
	 * The constructor is called when a UIComponent or a sub-class of UIComponent is instantiated on stage or by using {@code attachMovie()} in ActionScript. This component can <b>not</b> be instantiated using {@code new} syntax. When creating new components that extend UIComponent, ensure that a {@code super()} call is made first in the constructor.
	 */
	private function UIComponent();

	private function onLoad() : Void;

	private function onLoadImpl() : Void;

	private function onUnload() : Void;

	/**
	 * Sets the width and height of the component at the same time using internal sizing mechanisms.
	 * @param width The new width of the component.
	 * @param height The new height of the component.
	 */
	public function setSize(width:Number, height:Number) : Void;

	/**
	 * Handle input from the game, via controllers or keyboard. The default handleInput will handle standalone and composite components.
	 * @param details An {@code InputDetails} object containing details from the interaction.
	 * @param pathToFocus A list of children in the focus path that are below this component. Components are responsible for calling {@code handleInput()} on the next component in the {@code pathToFocus} unless they choose to intercept the call.
	 * @returns A Boolean value specifying if the focus was handled or not by this component or sub-components. This suggests to components higher up in the focus path that they should not also handle the input.
	 * @see FocusHandler
	 * @see InputDetails
	 */
	public function handleInput(details:InputDetails, pathToFocus:Array) : Boolean;

	/**
	 * An internal property of the component has changed, requiring a redraw.  The invalidation mechanism lets components trigger multiple redraw commands at the same time, resulting in only a single redraw. the {@code invalidate()} method is public so that it can be called externally.
	 */
	public function invalidate() : Void;

	/**
	 * When the component has been invalidated, this method is called which validates the component, and redraws the component immediately by calling {@code draw()}. The {@code validateNow()} method is public so that it can be called externally.
	 */
	public function validateNow() : Void;

	/** @exclude */
	public function toString() : String;

	/** 
	 * This method is called to notify the back-end when a bound control fires an event.
	 */
	public function dispatchEventToGame(event:Object) : Void;

	/**
	 * Configure the interface when the component is initialized.  Use this method to set up sub-components, listeners, etc.
	 */
	private function configUI() : Void;

	/**
	 * Reset the scale of the component, and call {@code setSize()} with the initial component dimensions. Composite components such as ScrollBar can use this method to reset the scale of a component resized on the stage, and then reflow the sub-components to fit the new size. Usually called in the {@code configUI()} method before the first draw.
	 */
	private function initSize() : Void;

	/**
	 * Draw the component after it has been invalidated. Use this method to reflow component size and position, redraw data, etc.  When appropriate, ensure that a call to {@code super.draw()} is made when extending a component and overriding this method.
	 */
	private function draw() : Void;

	/**
	 * Called after focus has been given or taken from the component. Use this method to change the appearance or behavior of the component when the focus changes.
	 */
	private function changeFocus() : Void;

	private function onMouseWheel(delta:Number, target:Object) : Void;

	private function scrollWheel(delta:Number) : Void;

	private function dispatchEventAndSound(event:Object) : Void;

	private function dispatchSound(event:Object) : Void;

	private function playSound(soundEventName:String, soundTheme:String) : Void;

}