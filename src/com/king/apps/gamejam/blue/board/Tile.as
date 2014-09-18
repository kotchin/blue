package com.king.apps.gamejam.blue.board
{
import com.king.apps.gamejam.blue.resources.ResourceLoader;

import flash.display.MovieClip;

import flash.display.Sprite;

public class Tile extends Sprite
    {
        private var _neighbours : Vector.<Tile>;
        private var _checked : Boolean;
        private var _oil : int;

        private var _resourceLoader : ResourceLoader;
        private var _graphics : MovieClip;


        public function Tile(x : Number, y : Number, resourceLoader : ResourceLoader)
        {
            this.x = x;
            this.y = y;
            _resourceLoader = resourceLoader;

            redraw();
        }

        public function AddNeighbour(neighbour : Tile) {
            _neighbours.push(neighbour)
        }


        private function redraw() : void
        {
            if (_graphics)
            {
                removeChild(_graphics);
            }

            var resourceName : String = getResourceName();
            var graphicsClass : Class = _resourceLoader.getResourceClassByName(resourceName);
            _graphics = new graphicsClass;
            addChild(_graphics);
        }

        private function getResourceName() : String
        {
            return _checked ? "tile_explored_mc" : "tile_unexplored_mc";
        }


    }
}
