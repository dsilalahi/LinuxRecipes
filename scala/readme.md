

### 
```java
class MyClass(x: Int, y: Int) {           // Defines a new type MyClass with a constructor  
  require(y > 0, "y must be positive")    // precondition, triggering an IllegalArgumentException if not met
  def this (x: Int) = { ... }             // auxiliary constructor   
  def val1 = x                            // public method computed every time it is called  
  def val2 = y  
  private def test(a: Int): Int = { ... } // private method  
  
  val val3 = x + y                        // computed only once  
  
  override def toString =                 // overridden method  
      member1 + ", " + member2 
  }

new MyClass(1, 2) // creates a new object of type
```