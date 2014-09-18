package com.king.apps.gamejam.blue.board
{
import com.king.apps.gamejam.blue.resources.ResourceLoader;

public class BoardBuilder
    {
        public function BoardBuilder() {
        }

        public static function MakeBoard(boardType : String, resourceLoader : ResourceLoader, columns : int = 9, rows : int = 12) : Board
        {
            switch (boardType)
            {
                case TileGeometryType.TRIANGLES:
                    break;

                case TileGeometryType.RECTANGLES:
                    return createRectangularTileBoard(columns, rows, resourceLoader);
                    break;

                case TileGeometryType.HEXAGONS:
                    break;
            }

            return null;
        }

        private static function createRectangularTileBoard(columns : int, rows : int, resourceLoader : ResourceLoader) : Board
        {
            var tileContainer : Vector.<Tile> = new Vector.<Tile>();

            for (var i : int = 0; i < columns * rows; i++)
            {
                var xPosition : int = i % columns;
                var yPosition : int = i / rows;
                var tile : Tile = new Tile(xPosition *42 + 42/2,yPosition *42  + 42/2, resourceLoader);
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
                if(xPosition != 0 && yPosition != 0) {
                    var aboveLeftTile : Tile = tileContainer[i-columns-1];
                    tile.AddNeighbour(aboveLeftTile);
                    aboveLeftTile.AddNeighbour(tile);
                }

                tileContainer.push(tile);
            }
            return new Board(tileContainer);
        }
    }
}
