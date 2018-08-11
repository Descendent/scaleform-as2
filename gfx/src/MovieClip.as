import flash.display.BitmapData;
import flash.geom.Matrix;
import flash.geom.Rectangle;
import flash.geom.Transform;
/**************************************************************************

Filename    :   MovieClip.as

Copyright   :   Copyright 2011 Autodesk, Inc. All Rights reserved.

Use of this software is subject to the terms of the Autodesk license
agreement provided at the time of installation or download, or which
otherwise accompanies this software in either electronic or hard copy form.

**************************************************************************/
intrinsic dynamic class MovieClip
{
	public var _alpha : Number;
	public var _currentframe : Number;
	public var _droptarget : String;
	public var _focusrect : Boolean;
	public var _framesloaded : Number;
	public var _height : Number;
	public var _highquality : Number;
	public var _lockroot : Boolean;
	public var _name : String;
	public var _parent : MovieClip;
	public var _quality : String;
	public var _rotation : Number;
	public var _soundbuftime : Number;
	public var _target : String;
	public var _totalframes : Number;
	public var _url : String;
	public var _visible : Boolean;
	public var _width : Number;
	public var _x : Number;
	public var _xmouse : Number;
	public var _xscale : Number;
	public var _y : Number;
	public var _ymouse : Number;
	public var _yscale : Number;
	public var scale9Grid : Rectangle;
	public var enabled : Boolean;
	public var focusEnabled : Boolean;
	public var hitArea : Object;
	public var menu : ContextMenu;
	public var tabChildren : Boolean;
	public var tabEnabled : Boolean;
	public var tabIndex : Number;
	public var tooltipText : String;
	public var trackAsMenu : Boolean;
	public var useHandCursor : Boolean;
	public var cacheAsBitmap : Boolean;
	public var filters : Array;
	public var opaqueBackground : Number;
	public var scrollRect : Object;
	public var transform : Transform;
	public var blendMode : Object;
	public var _xrotation : Number;
	public var _yrotation : Number;
	public var _z : Number;
	public var _zScale : Number;
	public var _matrix3d : Array;
	public var _perspfov : Number;
	public var hitTestDisable : Boolean;
	public var noAdvance : Boolean;
	public var topmostLevel : Boolean;
	public var rendererString : String;
	public var rendererFloat : Number;
	public var focusGroup : Number;

	public function attachAudio(id:Object) : Void;

	public function attachBitmap(bmp:BitmapData, depth:Number, pixelSnapping:String, smoothing:Boolean) : Void;

	public function attachMovie(id:String, name:String, depth:Number, initObject:Object) : MovieClip;

	public function clear() : Void;

	public function createEmptyMovieClip(name:String, depth:Number) : MovieClip;

	public function beginBitmapFill(bmp:BitmapData, matrix:Matrix, repeat:Boolean, smoothing:Boolean) : Void;

	public function beginFill(rgb:Number, alpha:Number) : Void;

	public function beginGradientFill(fillType:String, colors:Array, alphas:Array, ratios:Array, matrix:Object, spreadMethod:String, interpolationMethod:String, focalPointRatio:Number) : Void;

	public function lineGradientStyle(fillType:String, colors:Array, alphas:Array, ratios:Array, matrix:Object, spreadMethod:String, interpolationMethod:String, focalPointRatio:Number) : Void;

	public function createTextField(instanceName:String, depth:Number, x:Number, y:Number, width:Number, height:Number) : TextField;

	public function curveTo(controlX:Number, controlY:Number, anchorX:Number, anchorY:Number) : Void;

	public function duplicateMovieClip(name:String, depth:Number, initObject:Object) : MovieClip;

	public function endFill() : Void;

	public function getBounds(bounds:Object) : Object;

	public function getRect(bounds:Object) : Object;

	public function getBytesLoaded() : Number;

	public function getBytesTotal() : Number;

	public function getDepth() : Number;

	public function getInstanceAtDepth(depth:Number) : MovieClip;

	public function getNextHighestDepth() : Number;

	public function getSWFVersion() : Number;

	public function getTextSnapshot() : TextSnapshot;

	public function getURL(url:String, window:String, method:String) : Void;

	public function globalToLocal(pt:Object) : Void;

	public function gotoAndPlay(frame:Object) : Void;

	public function gotoAndStop(frame:Object) : Void;

	public function hitTest() : Boolean;

	public function lineStyle(thickness:Number, rgb:Number, alpha:Number, pixelHinting:Boolean, noScale:String, capsStyle:String, jointStyle:String, miterLimit:Number) : Void;

	public function lineTo(x:Number, y:Number) : Void;

	public function loadMovie(url:String, method:String) : Void;

	public function loadVariables(url:String, method:String) : Void;

	public function localToGlobal(pt:Object) : Void;

	public function moveTo(x:Number, y:Number) : Void;

	public function nextFrame() : Void;

	public function play() : Void;

	public function prevFrame() : Void;

	public function removeMovieClip() : Void;

	public function setMask(mc:Object) : Void;

	public function startDrag(lockCenter:Boolean, left:Number, top:Number, right:Number, bottom:Number) : Void;

	public function stop() : Void;

	public function stopDrag() : Void;

	public function swapDepths(target:Object) : Void;

	public function unloadMovie() : Void;

	public function valueOf() : MovieClip;

	public function onData() : Void;

	public function onDragOut() : Void;

	public function onDragOver() : Void;

	public function onEnterFrame() : Void;

	public function onKeyDown() : Void;

	public function onKeyUp() : Void;

	public function onKillFocus(newFocus:Object) : Void;

	public function onLoad() : Void;

	public function onMouseDown() : Void;

	public function onMouseMove() : Void;

	public function onMouseUp() : Void;

	public function onPress() : Void;

	public function onRelease() : Void;

	public function onReleaseOutside() : Void;

	public function onRollOut() : Void;

	public function onRollOver() : Void;

	public function onSetFocus(oldFocus:Object) : Void;

	public function onUnload() : Void;

}