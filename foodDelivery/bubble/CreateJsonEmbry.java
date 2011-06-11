import java.util.*;

import java.text.*;import org.json.*;

public class CreateJsonEmbry
{
/*
    {
        "title": "All Day Event",
        "start": "2010-03-01"
    },
*/

    List<Person> people = new ArrayList<Person>();
    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");

    public static void main(String[] args)
        throws Exception
    {
        if( args.length != 3 )
        {
            usage();
        }
        CreateJsonEmbry embry = new CreateJsonEmbry();
        embry.createPeople();
        embry.dumpList( Integer.parseInt( args[0]), Integer.parseInt( args[1] ), Integer.parseInt( args[2] ) );
    }

    public void dumpList( int startIndex, int year, int month )
        throws Exception
    {
        GregorianCalendar cal = new GregorianCalendar( year, month - 1, 1 );  //months are zero based for some ungodly reason
        JSONArray arr = new JSONArray();
        while(cal.get(Calendar.MONTH) < month + 1)  //do two months at a time...and it's zero based
        {
            if( isWeekend(cal) )
            {
                JSONObject o = new JSONObject();
                o.put("title", people.get(startIndex++).getName());
                o.put("start", formatter.format(cal.getTime()));
                arr.put(o);
            }
            if( startIndex == people.size() )
            {
                startIndex = 0;
            }
            cal.add(Calendar.DATE, 1);
        }
        System.out.println(arr.toString());
    }

    protected boolean isWeekend( GregorianCalendar cal )
    {
        if( cal.get(Calendar.DAY_OF_WEEK)==Calendar.SATURDAY || cal.get(Calendar.DAY_OF_WEEK)==Calendar.SUNDAY  )
        {
            return true;
        }
        return false;
    }


    public static void usage()
    {
        System.out.println("usage:  CreateJsonEmbry <start id> <year> <month>");
    }

    protected void createPeople()
    {
        people.add(new Person( "Cathy Romano", "romano.cathy@gmail.com", null, null ));;
        people.add(new Person( "Laura Shelton", "handbellhog@hotmail.com", null, null ));;
        people.add(new Person( "Bridget Kerrigan", "bkerrigan@fitnessfirstclubs.com", null, null ));;
        people.add(new Person( "Tom Houck", "Tphouck@aol.com", null, null ));;
        people.add(new Person( "Don McCoy", "dmccoy1030@aol.com", null, null ));;
        people.add(new Person( "Mike Latham", "mike.latham@verizon.net", null, null ));;
        people.add(new Person( "Reanna Nagle", "jeremyandreanna@yahoo.com", null, null ));;
        people.add(new Person( "Renee Glauser", "rglauser@cox.net", null, null ));;
        people.add(new Person( "Steven DiLeonardo", "svdileonardo@verizon.net", null, null ));;
        people.add(new Person( "Nancy Larson", "", null, null ));;
        people.add(new Person( "Heather Young", "", null, null ));;
        people.add(new Person( "Carolyn Murphy", "a7492097@aol.com", null, null ));;
    }
}

class Person
{


    public Person( String name, String email, String homePhone, String cellPhone)
    {
        this.name=name;
        this.homePhone = homePhone;
        this.cellPhone = cellPhone;
        this.emailAddress=email;
    }
  /**
   * Name property.
   */
  protected String name = null;

  /**
   * Get name property.
   *
   *@return Name property.
   */
  public String getName() {
   return this.name;
  }

  /**
   * Set name property.
   *
   *@param name New name property.
   */
  public void setName(String name) {
   this.name = name;
  }


  /**
   * HomePhone property.
   */
  protected String homePhone = null;

  /**
   * Get homePhone property.
   *
   *@return HomePhone property.
   */
  public String getHomePhone() {
   return this.homePhone;
  }

  /**
   * Set homePhone property.
   *
   *@param homePhone New homePhone property.
   */
  public void setHomePhone(String homePhone) {
   this.homePhone = homePhone;
  }


  /**
   * CellPhone property.
   */
  protected String cellPhone = null;

  /**
   * Get cellPhone property.
   *
   *@return CellPhone property.
   */
  public String getCellPhone() {
   return this.cellPhone;
  }

  /**
   * Set cellPhone property.
   *
   *@param cellPhone New cellPhone property.
   */
  public void setCellPhone(String cellPhone) {
   this.cellPhone = cellPhone;
  }


  /**
   * EmailAddress property.
   */
  protected String emailAddress = null;

  /**
   * Get emailAddress property.
   *
   *@return EmailAddress property.
   */
  public String getEmailAddress() {
   return this.emailAddress;
  }

  /**
   * Set emailAddress property.
   *
   *@param emailAddress New emailAddress property.
   */
  public void setEmailAddress(String emailAddress) {
   this.emailAddress = emailAddress;
  }


}
