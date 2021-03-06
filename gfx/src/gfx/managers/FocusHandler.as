﻿import gfx.managers.InputDelegate;
import gfx.ui.NavigationCode;
import System.capabilities;
/**
 * Manage focus between the components.  Intercept focus from the player, and hand it off to the "focused" component through the display-list hierarchy using a bubbling approach. Focus can be interupted or handled on every level.
 */
intrinsic class gfx.managers.FocusHandler
{
	static private var _instance : FocusHandler;
	private var inputDelegate : InputDelegate;
	private var currentFocusLookup : Array;
	private var actualFocusLookup : Array;
	private var inited : Boolean;

	/** Return a reference to the static FocusHandler instance.*/
	static public function get instance() : FocusHandler;


	/**
	 * Create a new FocusHandler instance. This method should only be called internally by the FocusHandler class, as the implementation is a Singleton.
	 */
	public function FocusHandler();

	private function initialize() : Void;

	/**
	 * Returns the current focus, according to the focusHandler. This may vary from the actual stage focus.
	 */
	public function getFocus(focusIdx:Number) : MovieClip;

	/**
	 * Set focus to a component.  This is called internally when stage focus changes, and can also be called manually to set focus to the first component in a movie. The actual focus is determined by recursively checking the {@code focusTarget} of the component.
	 * @param focus The movieclip to apply focus to.
	 */
	public function setFocus(focus:MovieClip, focusIdx:Number) : Void;

	/**
	 * Handle input events from the {@link InputDelegate}.  Input details are passed onto the first item in the {@code pathToFocus}, which is a display list hierarchy of Scaleform components, or any view that implements a "handleInput" method. If a view "handles" input, it will return {@code true}.  If this method receives a return value of {@code false}, it will pass the input onto the Scaleform player using the {@code Selection.moveFocus()} method.
	 * @param event The input event generated by the InputDelegate.
	 */
	public function handleInput(event:Object) : Void;

	private function getPathToFocus(focusIdx:Number) : Array;

	/**
	 * @exclude
	 */
	public function onSetFocus(oldFocus, newFocus, controllerIdx:Number) : Void;

	/**
	 * TextFields do not have any logic to stop focus from changing when they are the stage focus, so we check the caret index, and only change focus if it is at the top/bottom depending on the navigation direction.
	 */
	private function textFieldHandleInput(nav:String, controllerIdx:Number) : Boolean;

}