public class DemoMap {
 
    public static void testMap(){
        Map<String, String> mapName = new Map<String, String>();
				System.debug('the size of map ' +mapName.size());  
            mapName.put('Yellow', 'Bananas');
            mapName.put('Red', 'Apples');
            mapName.put('Orange', 'Oranges');
                System.debug('the keys are ' +mapName.keyset());
                System.debug('the values are ' +mapName.values());
            mapName.put('Black', 'Grapes');
            mapName.put('Green', 'Grapes');
                System.debug('the values are ' +mapName.values());
                System.debug('the values are ' +mapName.values());
        
        		System.debug('the values at key at red ' +mapName.get('Red')); 
        mapName.remove('Red');
        mapName.clear();
        Set<String> allKeys =mapName.keyset();
        For(String str : allKeys){
            	System.debug('the value at key ' +str + 'is' + mapName.get(str));
        }
        
        if(!mapName.isempty()){
            	System.debug('the map has no. of element ');
        }
        if(mapName.size() == 0){
    			System.debug('the map has no.of element ');
		}
    }
}