import gfx.controls.Button;
import gfx.controls.DragTarget;
import gfx.core.UIComponent;
import gfx.managers.DragManager;
import gfx.utils.Delegate;
/**
 *	The ItemSlot composes a button and a Drag target to add button-state functionality to and item with a dragTarget. This is useful when both clicking and dragging functionality is required.
 
 	@see InventorySlot For a non-button ItemSlot, see the InventorySlot.
 */
intrinsic class gfx.controls.ItemSlot extends UIComponent
{
	public var iconLinkage : String;
	public var soundMap : Object;
	private var dragOrigin : Boolean;
	private var _data : Object;
	private var _toggle : Boolean;
	private var _selected : Boolean;
	private var _dragAcceptTypes : Array;
	/** The button element of the ItemSlot. */
	public var button : Button;
	/** The drag target element of the ItemSlot. */
	public var dragTarget : DragTarget;
	private var icons : MovieClip;
	private var qtyFld : TextField;
	private var originalAllowDropFunction : Function;

	/**
	* The data object representing the item to be displayed. Item slot expects the object to have {@code type}, {@code quantity}. and {@code asset} properties. The {@code asset} property specifies the frame or label to display in the {@code icons} MovieClip.
	**/
	public function get data() : Object;
	public function set data(value:Object) : Void;

	public function get dragAcceptTypes() : Array;
	public function set dragAcceptTypes(value:Array) : Void;

	public function get toggle() : Boolean;
	public function set toggle(value:Boolean) : Void;

	public function get selected() : Boolean;
	public function set selected(value:Boolean) : Void;

	public function get disabled() : Boolean;
	public function set disabled(value:Boolean) : Void;


	private function ItemSlot();

	private function configUI() : Void;

	private function propagateEvent(event:Object) : Void;

	private function handlePress(event:Object) : Void;

	private function handleRelease(event:Object) : Void;

	private function beginDrag() : Void;

	private function update() : Void;

	private function acceptDrop(data:Object) : Void;

	private function allowDrop(data:Object) : Boolean;

	private function dragEnd(event:Object) : Void;

}