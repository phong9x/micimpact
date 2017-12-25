
package com.app.micimpact.bean.jpa;

import java.io.Serializable;

//import javax.validation.constraints.* ;
//import org.hibernate.validator.constraints.* ;

import java.util.List;

import javax.persistence.*;

/**
 * Persistent class for entity stored in table "user_roles"
 *
 * @author Telosys Tools Generator
 *
 */

@Entity
@Table(name="user_roles", catalog="micimpact" )
// Define named queries here
@NamedQueries ( {
  @NamedQuery ( name="UserRolesEntity.countAll", query="SELECT COUNT(x) FROM UserRolesEntity x" )
} )
public class UserRolesEntity implements Serializable {

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
    @Column(name="role", nullable=false, length=128)
    private String     role         ;



    //----------------------------------------------------------------------
    // ENTITY LINKS ( RELATIONSHIP )
    //----------------------------------------------------------------------
    @OneToMany(mappedBy="userRoles", targetEntity=UsersEntity.class)
    private List<UsersEntity> listOfUsers ;


    //----------------------------------------------------------------------
    // CONSTRUCTOR(S)
    //----------------------------------------------------------------------
    public UserRolesEntity() {
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
    //--- DATABASE MAPPING : role ( VARCHAR ) 
    public void setRole( String role ) {
        this.role = role;
    }
    public String getRole() {
        return this.role;
    }


    //----------------------------------------------------------------------
    // GETTERS & SETTERS FOR LINKS
    //----------------------------------------------------------------------
    public void setListOfUsers( List<UsersEntity> listOfUsers ) {
        this.listOfUsers = listOfUsers;
    }
    public List<UsersEntity> getListOfUsers() {
        return this.listOfUsers;
    }


    //----------------------------------------------------------------------
    // toString METHOD
    //----------------------------------------------------------------------
    public String toString() { 
        StringBuffer sb = new StringBuffer(); 
        sb.append("["); 
        sb.append(id);
        sb.append("]:"); 
        sb.append(role);
        return sb.toString(); 
    } 

}
