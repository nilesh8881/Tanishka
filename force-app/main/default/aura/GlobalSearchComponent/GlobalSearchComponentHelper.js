({
    getSearchResultsFromHandler : function(component,helper){      
        var action = component.get("c.getSearchRecords");
        action.setParams({ searchKey : component.get("v.searchKey") });
        
        // callback that is executed after the server-side action returns
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var result = response.getReturnValue();
                // SOSL will always return the list in the order they were queried
                component.set("v.accountList",result[0]);
                component.set("v.contactList",result[1]);
                component.set("v.oppList",result[2]);
                component.set("v.leadList",result[3]);
            }
            else if (state === "INCOMPLETE") {
                // do something
            }
                else if (state === "ERROR") {
                    var errors = response.getError();
                    if (errors) {
                        if (errors[0] && errors[0].message) {
                            console.log("Error message: " +errors[0].message);
                        }
                    } 
                    else {
                        console.log("Unknown error");
                    }
                }
        });
        $A.enqueueAction(action);
    },
 })