import gfx.events.EventDispatcher;
import gfx.ui.InputDetails;
import gfx.ui.NavigationCode;
/**
 * InputDelegate receives commands from the game, by intercepting keys, controller buttons, etc, and dispatches Input events. InputDetail objects are generated containing a navigation equivelant. FocusHandler will instantiate an InputDelegate when input is required.
 */
intrinsic class gfx.managers.InputDelegate extends EventDispatcher
{
	static private var _instance : InputDelegate;
	private var keyRepeatSuppressLookup : Object;
	private var keyRepeatStateLookup : Object;

	/** Returns the Singleton instance of the InputDelegate */
	static public function get instance() : InputDelegate;


	/**
	 * Create a new InputDelegate instance. This method should only be called internally by the InputDelegate class, as the implementation is a Singleton.
	 */
	public function InputDelegate();

	/**
	 * Enable or disable key repeat for a specific keycode for specified controller. Only applicable if system key repeat is on.
	 * @param	code The key code for the key.
	 * @param	value The repeat state.
	 */
	public function setKeyRepeat(code:Number, value:Boolean, controllerIdx:Number) : Void;

	/** 
	 * Request input from the game engine.
	 * @param type The type of the required interaction.
	 * @param code The code of the required input.
	 * @param scope The scope of the callBack.
	 * @param callBack The function name of the callBack.
	 * @return An Object containing relevant information about the requested input.
	 */
	public function readInput(type:String, code:Number, scope:Object, callBack:String) : Object;

	/**
	 * Convert input to readable navigation commands
	 * @param type The type of interaction
	 * @param code The numeric code of the input
	 * @param value Additional details from the input
	 * @return The navigation equivalent String.
	 */
	public function inputToNav(type:String, code:Number, value) : String;

	private function onKeyDown(controllerIdx:Number) : Void;

	private function onKeyUp(controllerIdx:Number) : Void;

	private function handleKeyPress(type:String, code:Number, controllerIdx:Number) : Void;

	private function getKeyRepeatState(controllerIdx:Number) : Object;

	private function getKeyRepeatSuppress(controllerIdx:Number) : Object;

}