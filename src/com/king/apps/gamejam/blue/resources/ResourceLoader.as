package com.king.apps.gamejam.blue.resources
{
    public class ResourceLoader
    {
        [Embed(source="../../../../../../../assets/assets.swf", symbol="tile_explored_mc")]
        private var exploredClipClass:Class;

        [Embed(source="../../../../../../../assets/assets.swf", symbol="tile_unexplored_mc")]
        private var unExploredClipClass:Class;

        public function ResourceLoader()
        {
        }

        public function getResourceClassByName(name : String) : Class
        {
            switch (name)
            {
                case "tile_explored_mc":
                    return exploredClipClass;

                case "tile_unexplored_mc":
                    return unExploredClipClass;
            }

            throw new Error("Resource name unrecognized, please map resource in ResourceLoader!");

        }
    }
}
