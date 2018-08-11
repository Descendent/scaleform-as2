import gfx.core.UIComponent;
import gfx.managers.DragManager;
/**
 *  Acts as a target for drag operations initiated with DragManager. The drag target will hide itself until a drag operation begins with a data object that it can accept, at which point it will show itself.

	While the usefulness of this class is limited, it provides a simple example for working with DragManager, and is the basis for the InventorySlot and ItemSlot components.
 */
intrinsic class gfx.controls.DragTarget extends UIComponent
{
	private var _dragAcceptTypes : Array;
	private var dragAcceptTypeHash : Object;

	/**
	 * Indicates the types of data this DragTarget will accept. These strings are matched against the "type" property of the data object passed to allowDrop. Setting dragAcceptTypes to ["*"] or null will cause it to accept all types.
	 *
	 * @param types An array of strings that will be matched against the data object "type" property.
	 */
	public function get dragAcceptTypes() : Array;
	public function set dragAcceptTypes(types:Array) : Void;


	/**
	 * The constructor is called when a DragTarget is instantiated on stage or by using {@code attachMovie()} in ActionScript. This component can <b>not</b> be instantiated using {@code new} syntax. When creating new components that extend DragTarget, ensure that a {@code super()} call is made first in the constructor.
	 */
	public function DragTarget();

	/**
	 * Returns true if the DragTarget instance will accept the specified data object. In this case it matches the data object's "type" property against the types specified in dragAcceptTypes, but this method can easily be overridden in subclasses to provide more advanced filtering.
	 *
	 * @param data The data object to check.
	 */
	public function allowDrop(data:Object) : Boolean;

	/**
	 * The DragManager has dropped data on to this component. It is public so that is can be externally overridden. See {@link ItemSlot}.
	 * @param data The data that is being dropped on the component.
	 */
	public function acceptDrop(data:Object) : Void;

	private function configUI() : Void;

	private function dragBegin(event:Object) : Void;

	private function dragEnd(event:Object) : Void;

	private function boundsCheck(data:Object) : Boolean;

	private function handleRollOver(controllerIdx:Number) : Void;

	private function handleRollOut(controllerIdx:Number) : Void;

}