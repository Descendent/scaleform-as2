/**
 * Defines the methods that all List components must define. Note that this interface is not implemented by the existing components, and does not need to be implemented, it is just a reference.
 */
interface gfx.interfaces.IList
{
	/**
	 * The data model to be displayed in the component.  The DataProvider can be an Array or any object exposing the appropriate API.
	 */
	public function get dataProvider() : Object;
	public function set dataProvider(value:Object) : Void;

	/**
	 * Set the index of the item that is selected in a single-selection list.
	 * @param value The new selected index.
	 */
	public function get selectedIndex() : Object;
	public function set selectedIndex(value:Number) : Void;


	/**
	 * Scrolls the list to the item at the specified index. If the index is not out of range, the scroll position does not change.
	 * @param index The index in the dataProvider to scroll to.
	 */
	public function scrollToIndex(index:Number) : Void;

}