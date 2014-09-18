package com.king.apps.gamejam.blue.board
{
import com.king.apps.gamejam.blue.resources.ResourceLoader;

import flash.display.Sprite;
import flash.events.MouseEvent;

public class Tile extends Sprite
    {
        private var _neighbours : Vector.<Tile>;
        private var _checked : Boolean;
        private var _oil : int;

        private var _resourceLoader : ResourceLoader;
        private var _graphics : Sprite;
        private var _tileIsWell : Boolean;


        public function Tile(x : Number, y : Number, resourceLoader : ResourceLoader, tileIsWell : Boolean)
        {
            _tileIsWell = tileIsWell;
            _neighbours = new Vector.<Tile>();
            this.x = x;
            this.y = y;
            _resourceLoader = resourceLoader;

            redraw();
        }

        public function AddNeighbour(neighbour : Tile) : void {
            _neighbours.push(neighbour)
        }

        private function redraw() : void
        {
            if (_graphics)
            {
                _graphics.removeEventListener(MouseEvent.CLICK, onMouseClicked);
                removeChild(_graphics);
            }

            var resourceName : String = getResourceName();
            var graphicsClass : Class = _resourceLoader.getResourceClassByName(resourceName);
            _graphics = new graphicsClass;
            _graphics.addEventListener(MouseEvent.CLICK, onMouseClicked);
            addChild(_graphics);
        }

        private function getResourceName() : String
        {
            return _checked ? "tile_explored_mc" : "tile_unexplored_mc";
        }

        private function onMouseClicked(event : MouseEvent) : void
        {
            if (_tileIsWell)
            {
                handleWellExplored();
            }
            else if (!_checked)
            {
                exploreThisAndNeighbours();
            }
        }

        private function handleWellExplored() : void
        {
            //TODO
        }

        private function exploreThisAndNeighbours() : void
        {
            exploreTile();
            for each (var neighbour : Tile in _neighbours)
            {
                neighbour.exploreTile();
            }
        }

        private function exploreTile() : void
        {
            if (!_checked && !_tileIsWell)
            {
                _checked = true;
                redraw();
            }
        }
    }
}
