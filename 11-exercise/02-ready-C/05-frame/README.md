# Activation record
| Activation Record/frame |
| :-----------: |
|  Actual parameters  |
| Return values   |
| Control link |
| Access link |
| Saved machine status |
| Local data |
| Temporaries |

## Caution
not all elements of Activation Record/frame will appear in the stack.  

Activation Record/frame is just a model that describes the function.  
```c
    int foo(int a, int b, ... )
    {
        int local_x=1;
        int temp;
        int return_val;

        temp = function(local_x);

        return_val = a+temp*b;

        return return_val;
    }
```
## ABI
the relationship between frame and register called caller and callee is not very strong, which means that the concept of frame is self-contained and is a perspective that describes a function.  

The caller and callee properties of register are not inherited frames, but in the register structure of a procedure.

```c
    typedef struct {
        int regvalue;
        char attribute;  /* Caller or Callee ; this variable's attribute is private */
        /* 
            Caller or Callee maybe confusing, Another formulation would be more appropriate.
            isNeedToSave.
            when attribute=isNeedToSave=True, the register need to push the value onto stack,and
            restore it at end of procedure.
            when attribute=isNeedToSave=True, the register need to push the value onto stack,and
            use it in followed executions, participate in calculations,and needn't to restore it
            at end of procedure.
        */

    }RegType;

    struct procedure{
        RegType zero;
        RegType ra;
        RegType s0; 
        RegType s1;
        RegType t0;
        RegType t1;
        RegType t2;
        RegType a0;
        RegType a1;
        RegType a2;
        RegType a3;
        RegType a4;
        RegType a5;
    };


    struct frame{
        char attribute; /* Caller or Callee; this variable's attribute is private */
        struct procedure p;
        Actual_parameters Ap;
        Return_values   Rv;
        Control_link    Cl;
        Access_link     Al;
        Saved_machine_status    Sms;
        Local_data  Ld;
        Temporaries T;
    }

```

When using the frame struct, the Caller and Callee relationship between frame1 and frame2 does not affect the Caller and Callee properties of the Register.the key word `private` represent this feature.   

the member `attribute` of `RegType` determines whether the register needs to be saved or not.   

when procedure is executed, the member `attribute` of `RegType` equals to `Caller` means the register 
needn't to remain the value of the register at the end of the procedure.   

in fact, the member `attribute` of `RegType` equals to `Caller` Typically used to pass parameters or return
value.they push the value onto stack is for the later calculations,not for restore value at the end of 
procedure.



