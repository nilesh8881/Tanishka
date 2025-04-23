public class ConstructorClass {

    String countryName;
    Integer countryPopulation;

    //Non-parameterized constructor
    public ConstructorClass(){}

    //Constructor that takes a string argument and Integer
    public ConstructorClass(String countryName, Integer countryPopulation){
        this.countryName = countryName;
        this.countryPopulation = countryPopulation;
    }

    /**
     * Method to print class variables
     */
    public void printClassVariables(){
        System.debug('Country Name: ' + countryName);
        System.debug('Country Population: ' + countryPopulation);
    }
}