import flash.external.ExternalInterface;
/**
 * The GameDelegate marshalls calls from Flash into the Game Engine, and vice versa using an ID-system. An immediate result returned from the Game Engine will be passed back to the calling object via the provided scope and callBack. Asynchronous results require an appropriate callback already installed with the GameDelegate.
 */
intrinsic class gfx.io.GameDelegate
{
	static private var responseHash : Object;
	static private var callBackHash : Object;
	static private var nextID : Number;
	static private var initialized : Boolean;

	/**
	 * Make a call on the Game Engine.
	 * @param methodName The name of the method in the Game Engine to call.
	 * @param params An array of parameters to call on the method.
	 * @param scope The scope of the callBack.
	 * @param callBack The function name of the callBack.
	 */
	static public function call(methodName:String, params:Array, scope:Object, callBack:String) : Void;

	/**
	 * The Game Engine has sent data. The callBack associated with the uid will be made.
	 * @param uid The unique ID created when the call was first made.
	 * @param ...rest The parameters to return in the callBack.
	 */
	static public function receiveResponse(uid:Number) : Void;

	/**
	 * Add a callBack that the Game Engine can use to pass in data using a specific method name. The callBack will be made any time the method is called from the Game Engine. Only one component can register for a specific method call.
	 * @param methodName The name of the method to call on the game.
	 * @param scope The scope of the callBack.
	 * @param callBack The function name of the callBack.
	 */
	static public function addCallBack(methodName:String, scope:Object, callBack:String) : Void;

	/**
	 * A method has been called from the Game Engine. Route the function call to the callBack that has already been registered.
	 * @param methodName The name of the method that has been called from the GameEngine.
	 */
	static public function receiveCall(methodName:String) : Void;

	/**
	 * Initialize the ExternalInterface callBacks. This happens once the application has requested notification for a callBack.
	 */
	static private function initialize() : Void;

}