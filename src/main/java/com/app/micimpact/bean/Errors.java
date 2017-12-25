
package com.app.micimpact.bean;

import java.io.Serializable;

import javax.validation.constraints.*;


public class Errors implements Serializable {

    private static final long serialVersionUID = 1L;

    //----------------------------------------------------------------------
    // ENTITY PRIMARY KEY ( BASED ON A SINGLE FIELD )
    //----------------------------------------------------------------------
    @NotNull
    private Integer id;

    //----------------------------------------------------------------------
    // ENTITY DATA FIELDS 
    //----------------------------------------------------------------------    
    @NotNull
    @Size( min = 1, max = 255 )
    private String errorCode;

    @NotNull
    @Size( min = 1, max = 255 )
    private String errorMassage;



    //----------------------------------------------------------------------
    // GETTER & SETTER FOR THE KEY FIELD
    //----------------------------------------------------------------------
    public void setId( Integer id ) {
        this.id = id ;
    }

    public Integer getId() {
        return this.id;
    }


    //----------------------------------------------------------------------
    // GETTERS & SETTERS FOR FIELDS
    //----------------------------------------------------------------------
    public void setErrorCode( String errorCode ) {
        this.errorCode = errorCode;
    }
    public String getErrorCode() {
        return this.errorCode;
    }

    public void setErrorMassage( String errorMassage ) {
        this.errorMassage = errorMassage;
    }
    public String getErrorMassage() {
        return this.errorMassage;
    }


    //----------------------------------------------------------------------
    // toString METHOD
    //----------------------------------------------------------------------
 
        public String toString() { 
        StringBuffer sb = new StringBuffer(); 
        sb.append(id);
        sb.append("|");
        sb.append(errorCode);
        sb.append("|");
        sb.append(errorMassage);
        return sb.toString(); 
    } 


}
