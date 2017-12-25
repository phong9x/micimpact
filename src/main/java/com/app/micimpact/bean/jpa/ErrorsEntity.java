
package com.app.micimpact.bean.jpa;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

/**
 * Persistent class for entity stored in table "errors"
 *
 * @author Telosys Tools Generator
 *
 */

@Entity
@Table(name="errors", catalog="micimpact" )
// Define named queries here
@NamedQueries ( {
  @NamedQuery ( name="ErrorsEntity.countAll", query="SELECT COUNT(x) FROM ErrorsEntity x" )
} )
public class ErrorsEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    //----------------------------------------------------------------------
    // ENTITY PRIMARY KEY ( BASED ON A SINGLE FIELD )
    //----------------------------------------------------------------------
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    @Column(name="id", nullable=false)
    private Integer    id           ;


    //----------------------------------------------------------------------
    // ENTITY DATA FIELDS 
    //----------------------------------------------------------------------    
    @Column(name="error_code", nullable=false, length=255)
    private String     errorCode    ;

    @Column(name="error_massage", nullable=false, length=255)
    private String     errorMassage ;



    //----------------------------------------------------------------------
    // ENTITY LINKS ( RELATIONSHIP )
    //----------------------------------------------------------------------

    //----------------------------------------------------------------------
    // CONSTRUCTOR(S)
    //----------------------------------------------------------------------
    public ErrorsEntity() {
		super();
    }
    
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
    //--- DATABASE MAPPING : error_code ( VARCHAR ) 
    public void setErrorCode( String errorCode ) {
        this.errorCode = errorCode;
    }
    public String getErrorCode() {
        return this.errorCode;
    }

    //--- DATABASE MAPPING : error_massage ( VARCHAR ) 
    public void setErrorMassage( String errorMassage ) {
        this.errorMassage = errorMassage;
    }
    public String getErrorMassage() {
        return this.errorMassage;
    }


    //----------------------------------------------------------------------
    // GETTERS & SETTERS FOR LINKS
    //----------------------------------------------------------------------

    //----------------------------------------------------------------------
    // toString METHOD
    //----------------------------------------------------------------------
    public String toString() { 
        StringBuffer sb = new StringBuffer(); 
        sb.append("["); 
        sb.append(id);
        sb.append("]:"); 
        sb.append(errorCode);
        sb.append("|");
        sb.append(errorMassage);
        return sb.toString(); 
    } 

}
