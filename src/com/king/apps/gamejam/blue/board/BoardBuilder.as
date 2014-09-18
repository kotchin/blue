package com.king.apps.gamejam.blue.board
{
import com.king.apps.gamejam.blue.resources.ResourceLoader;

public class BoardBuilder
    {
        public function BoardBuilder() {
        }

        public static function MakeBoard(type : String, resourceLoader: ResourceLoader , columns : int = 9, rows : int = 12) : Board
        {
            switch (type)
            {
                case TileType.TRIANGLES:
                    break;

                case TileType.RECTANGLES:
                    return createRectangularTileBoard(columns, rows,resourceLoader);
                    break;

                case TileType.HEXAGONS:
                    break;
            }

            return null;
        }

        private static function createRectangularTileBoard(columns : int, rows : int, resourceLoader: ResourceLoader ) : Board
        {
            var tileContainer : Vector.<Tile> = new Vector.<Tile>();

            for (var i : int = 0; i < columns * rows; i++)
            {
                var xPosition : int = i % columns;
                var yPosition : int = i / rows;
                var tile : Tile = new Tile(xPosition,yPosition,resourceLoader)
                if(xPosition != 0) {
                    var leftTile : Tile = tileContainer[i-1];
                    tile.AddNeighbour(leftTile);
                    leftTile.AddNeighbour(tile);
                }
                if(yPosition != 0) {
                    var aboveTile : Tile = tileContainer[i-columns];
                    tile.AddNeighbour(aboveTile);
                    aboveTile.AddNeighbour(tile);
                }
                tileContainer.push(tile);
            }
            return new Board(tileContainer);
        }
    }
}
