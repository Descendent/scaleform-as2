import flash.external.ExternalInterface;
import gfx.events.EventDispatcher;
/**
 * DataProvider that can be bound to a game/application.  This data provider can register itself with the backend, and interface with data stores linked to CLIK components on the stage.
 */
intrinsic class gfx.data.GameDataProvider extends EventDispatcher
{
	public var length : Object;
	private var bindingName : String;

	public function GameDataProvider(binding:String);

	public function requestItemAt(index:Number, scope:Object, callBack:String) : Void;

	public function requestItemRange(startIndex:Number, endIndex:Number, scope:Object, callBack:String) : Void;

	public function invalidate(length:Number) : Void;

}