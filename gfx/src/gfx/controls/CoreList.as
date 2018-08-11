import flash.geom.Rectangle;
import gfx.core.UIComponent;
import gfx.data.DataProvider;
/**
 * An abstract class used to display a list of data, and set a selectedIndex (or indices). This class only manages data, and instantiating itemRenderers, but the sub-class must request the renderers and arrange them. It is sub-classed by the ScrollingList and TileList components.
 */
intrinsic class gfx.controls.CoreList extends UIComponent
{
	public var soundMap : Object;
	private var _dataProvider : Object;
	private var _itemRenderer : String;
	private var _selectedIndex : Number;
	private var _labelField : String;
	private var _labelFunction : Function;
	private var externalRenderers : Boolean;
	private var renderers : Array;
	private var deferredScrollIndex : Number;
	private var inspectableRendererInstanceName : String;
	private var container : MovieClip;

	public function get itemRenderer() : String;
	public function set itemRenderer(value:String) : Void;

	/**
	 * The data model displayed in the component. The dataProvider can be an Array or any object exposing the appropriate API, defined in the {@code IDataProvider} interface. If an Array is set as the dataProvider, functionality will be mixed into it by the {@code DataProvider.initialize} method. When a new DataProvider is set, the {@code selectedIndex} property will be reset to 0.
	 * @see DataProvider
	 * @see IDataProvider
	 */
	public function get dataProvider() : Object;
	public function set dataProvider(value:Object) : Void;

	/**
	 * The index of the item that is selected in a single-selection list.
	 */
	public function get selectedIndex() : Number;
	public function set selectedIndex(value:Number) : Void;

	/**
	 * The name of the field in the {@code dataProvider} model to be displayed as the label for itemRenderers.  A {@code labelFunction} will be used over a {@code labelField} if it is defined.
	 * @see #itemToLabel
	 */
	public function get labelField() : String;
	public function set labelField(value:String) : Void;

	/**
	 * The function used to determine the label for itemRenderers. A {@code labelFunction} will override a {@code labelField} if it is defined.
	 * @see #itemToLabel
	 */
	public function get labelFunction() : Function;
	public function set labelFunction(value:Function) : Void;

	/**
	 * The amount of the component's width that can be used for renderers. This can be overridden to accommodate padding or ScrollBars.
	 */
	public function get availableWidth() : Number;

	/**
	 * The amount of the component's height that can be used for renderers. This can be overridden to accommodate padding or ScrollBars
	 */
	public function get availableHeight() : Number;

	/**
	 * The name of data renderers to be used in this list instance. The names are a string followed by consecutive numbers incrementing from 0 or 1. For instance "renderer1, renderer2, renderer3, etc". The renderers must be in the parent timeline of the list instance in order to be used. If a specific numbered clip is missing, then only the renderers up to that point will be used.
	 */
	public function get rendererInstanceName() : String;
	public function set rendererInstanceName(value:String) : Void;


	/**
	 * The constructor is called when a CoreList or a sub-class of CoreList is instantiated on stage or by using {@code attachMovie()} in ActionScript. This component can <b>not</b> be instantiated using {@code new} syntax. When creating new components that extend CoreList, ensure that a {@code super()} call is made first in the constructor.
	 */
	public function CoreList();

	/**
	 * Scrolls the list to the item at the specified index. If the index is not out of range, the scroll position does not change. This method is not implemented in CoreList, so it must be implemented in sub-classes.
	 * @param index The index in the {@code dataProvider} to scroll to.
	 */
	public function scrollToIndex(index:Number) : Void;

	/**
	 * Convert an item to a label string using the {@code labelField} and {@code labelFunction}.
	 * @param item The item to convert to a label.
	 * @returns The converted label string.
	 * @see #labelField
	 * @see #labelFunction
	 */
	public function itemToLabel(item:Object) : String;

	/**
	 * The current data has become invalid, either by a data change, or a display change such as scrolling. It is up to the sub-classes to determine the behaviour.
	 */
	public function invalidateData() : Void;

	/**
	 * Set a list of external MovieClips to use as renderers, instead of auto-generating the renderers at run-time. The rendererInstance property uses this method to set the renderer list.
	 */
	public function setRendererList(value:Array) : Void;

	/** @exclude */
	public function toString() : String;

	private function configUI() : Void;

	/**
	 * Called by sub-classes to create a single renderer based on an index.  The renderer is specified by the {@code itemLinkage} property.
	 * @param index The index in the dataProvider
	 * @returns The newly-created itemRenderer
	 */
	private function createItemRenderer(index:Number) : MovieClip;

	private function setUpRenderer(clip:MovieClip) : Void;

	/**
	 * Called by sub-classes to create multiple renderers between a range of indexes.
	 * @param startIndex The first index of items in the dataProvider to create
	 * @param endIndex The endIndex of items in the dataProvider to create
	 * @returns An Array of itemRenderers
	 */
	private function createItemRenderers(startIndex:Number, endIndex:Number) : Array;

	private function draw() : Void;

	/**
	 * Create new renderers and destroy old renderers to ensure there are a specific number of renderers in the component.
	 * @param totalRenderers The number of renderers that the component needs.
	 */
	private function drawRenderers(totalRenderers:Number) : Void;

	/**
	 * Get a renderer based on a data index.  The default method assumes the renderers are all visible, and indexed accordingly.  Sub-classes may have to use math to determine if an item is currently displayed.
	 * @param index The index in the DataProvider
	 * @returns A reference to the renderer that contains the specified data
	 */
	private function getRendererAt(index:Number) : MovieClip;

	private function resetRenderers() : Void;

	private function drawLayout(rendererWidth:Number, rendererHeight:Number) : Void;

	private function onDataChange(event:Object) : Void;

	private function dispatchItemEvent(event:Object) : Void;

	private function handleItemClick(event:Object) : Void;

}