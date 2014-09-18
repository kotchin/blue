package com.king.apps.gamejam.blue.board
{
import flash.display.Sprite;
public class Tile extends Sprite
    {
    private var _neighbours : Vector.<Tile>;
    private var _checked : Boolean;
    private var _oil : int;

        public function Tile(x : Number , y : Number)
        {
            this.x = x;
            this.y = y;
        }

        public function AddNeighbour(neighbour : Tile) {
            _neighbours.push(neighbour)
        }




    }
}
