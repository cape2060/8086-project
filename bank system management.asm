.model small
.stack 64
.data
  msg0 db "|      | ||||| |      |||||    |||    |\  /| |||||$"
  msg1 db "|      | |     |     |||     ||   ||  | \/ | |     $"
  msg2 db "|  /\  | |||   |    |||     ||     || |    | |||     $"
  msg3 db "| /  \ | |     |     |||     ||   ||  |    | |         $"
  msg4 db "|/    \| ||||| |||||  |||||    |||    |    | |||||      $"
  newline db 13,10,'$' 
  msg5 db "       TO MY BANK ACCOUNT MANAGEMENT SYSTEM$"
  msg20 db "             DEVELOPED BY PRAJIN$"
  
  msg6 db "Enter the number you want to see!!!!:$" 
  msg7 db "1).Check the Balance.$"
  msg8 db "2).Deposit Money$"
  msg9 db "3).Withdraw Money$"
  msg00 db "4).Open Bank Account$"
  msg01 db "Enter the bank Account Number:$"
  msg02 db "Your Bank Account Exist$"
  msg03 db "Incorrect Bank Account No$"
  msg04 db "Enter the Password(4 number combination):$"
  msg05 db "Entered number is not in the list$"
  msg06 db "Enter again:$"  
  msg07 db "Entered password is correct.$"
  msg08 db "Incorrect password$"
  msg09 db "Your Balance in your Account is:$" 
  msg10 db "Try Again:$"
  msg11 db "Enter the amount you want to Deposit(limit 50000):$"
  msg12 db "NRs.$"
  msg13 db "Enter the amount you want to Withdraw(limit 50000):$" 
  msg14 db "You have not enough balance.$" 
  msg15 db "Enter your name:$"
  msg19 db "Enter your account number you want:$"
  msg16 db "Enter your password:$"
  msg17 db "Re-type password:$"
  msg18 db "Your acoount is sucessfully created.$"
   ;bank account numeber data base
  array db "11111111110222222222203333333333$"
  array1 db "11110222203333$"
  person1_balance db "NRs.10123100$"
  person2_balance db "NRs.30123100$" 
  person3_balance db "NRs.20123100$"       

  buffer db 10
         db ?
         input db 10 dup ('$')
         password db 10 dup ('$')
         deposit db 10 dup ('$')
         deposit_save db 10 dup ('$')
         withdraw db 10 dup ('$')
         withdraw_save db 10 dup ('$')
         yourname db 50 dup ('$')
         accountno db 10 dup ('$')
         password1 db 10 dup ('$')
         password2 db 10 dup ('$')
  .code
  main proc
    mov ax,@data
    mov ds,ax
    
    welcome:mov dx,offset msg0 ;WELCOME SCREEN PROCEDURE AND THE LIST THAT CAN BE DONE IN MY BANK SYSTEM MANAGEMENT
    mov ah,09h
    int 21h
    
    mov dx,offset newline
    mov ah,09h
    int 21h
    
    mov dx,offset msg1
    mov ah,09h
    int 21h
    
      mov dx,offset newline
    mov ah,09h
    int 21h
   
    mov dx,offset msg2
    mov ah,09h
    int 21h    
      mov dx,offset newline
    mov ah,09h
    int 21h
    
    
    mov dx,offset msg3
    mov ah,09h
    int 21h      
    
      mov dx,offset newline
    mov ah,09h
    int 21h
    
    
    mov dx,offset msg4
    mov ah,09h
    int 21h
    
    mov dx,offset newline
    mov ah,09h
    int 21h
     
      mov dx,offset msg5
    mov ah,09h
    int 21h
       
       
    lea dx,newline
    int 21h
    
    mov dx,offset msg20
    mov ah,09h
    int 21h
       
      
    lea dx,newline
    int 21h
          mov dx,offset msg7
    mov ah,09h
    int 21h
           
       
    lea dx,newline
    int 21h      
          mov dx,offset msg8
    mov ah,09h
    int 21h
    
      
    lea dx,newline
    int 21h
          mov dx,offset msg9
    mov ah,09h
    int 21h
    
      
    lea dx,newline
    int 21h
          mov dx,offset msg00
    mov ah,09h
    int 21h       
    
      
    lea dx,newline
    int 21h
    
    
     lea dx,msg6    ;END OF WELCOME SCREEN ANS DISPLATING WHA I CAN DO IN THIS SYSTEM.
    int 21h
    
    ;till here print now real challenge start
    incorrect_number:mov ah,01h
    int 21h
    
    cmp al,31h
    jz balance_checking
    cmp al,32h
    jz DEPOSIT_MONEY 
    cmp al,33h
    jz withdraw_money
    cmp al,34h
    jz create_account
    lea dx,newline
    mov ah,09h
    int 21h
    
    mov dx,offset msg05
    mov ah,09h
    int 21h 
    lea dx,newline
     mov ah,09h
     int 21h
     lea dx,msg06
     mov ah,09h
     int 21h
     jmp incorrect_number
     
    
    ;FOR CHECKING BALANCE
     balance_checking:
      lea dx,newline
      mov ah,09h
      int 21h
      
     
     lea dx,msg01
     mov ah,09h
     int 21h
     mov dx,offset input
     mov ah,0ah
     int 21h
    
     mov ch,03
     mov si,offset array
    
     
     looping1:lea di,input+2
     
      mov cl,0bh
     mov dx,0000h
 
     
     looping: cmp [si],30h  ;compare with 0 meaning 1 account no is checked with input and if valid account no it will acept ot
     jz next_number 
    then: mov bl,[si]
     
     cmp [di],'$'
     jz stop
     cmp bl,[di]
     jz count
     their:inc di
     inc si
     dec cl
     jnz looping
 
     dec ch
     jnz looping1 
     
     
     next_number:     cmp dh,10  ;compare the bank account number which is matched with database
     jz stop
     lea si,array
     add bp,0011  ;adding decimal 11 to reach to next bank accounnt number because in each occurance of 0 multiple of 11 need to add 
     add si,bp
     mov dh,00h
     jmp looping1
     
     
     stop:cmp dh,0ah
     jz correct
     
     mov dx,offset newline 
     mov ah,09h
     int 21h
     
     lea dx,msg03
     mov ah,09h
     int 21h
  
    ;Ending
     next:lea dx,newline
     mov ah,09h
     int 21h
     
     
     
     
   mov ah,4ch ;termination
   int 21h  
     
     
     
   
  
  mov dx,offset newline 
     mov ah,09h
     int 21h
     
  
  correct:  mov dx,offset newline 
     mov ah,09h
     int 21h
     
  mov dx,offset msg02
  mov ah,09h
  int 21h 
  lea dx,newline
     mov ah,09h
     int 21h
     
     lea dx,msg04
     mov ah,09h
     int 21h 
      
     retry:mov si,offset password 
     mov ch,04h
    
     
     taking_input:
     mov ah,08h ;take char input without echo
     int 21h                                 
     mov [si],al
     inc si
     mov dl,'*'
     mov ah,02h
     int 21h 
     dec ch
     jnz taking_input
     
     jmp password_checking
     
   end:jmp next 
   
   
   
     count:inc dh
     jmp their  
       
    
   password_checking:mov cl,00h 
   mov si,offset input+2
   cmp [si],31h
   jz checking
    cmp [si],32h
   jz checking1
    cmp [si],33h
   jz checking2
   
   done:cmp cl,04h 
   jz send
   lea dx,newline 
   mov ah,09h
   int 21h
   mov dx,offset msg08
   mov ah,09h
   int 21h
    lea dx,newline 
   mov ah,09h
   int 21h
   lea dx,msg10
   int 21h
   inc bh
 
   jmp retry
   
   done1:jmp end
   
   
   
    send: lea dx,newline 
   mov ah,09h
   int 21h
    mov dx,offset msg07
   mov ah,09h
   int 21h 
   
   jmp show_money
   
   ;jmp done1
         
   
    
   security:mov dl,[bx]
   cmp [di],dl
   jz right
   again:inc bx
   inc di
   dec ch
   jnz security
   
   jmp done
   
   
   
   
   right:inc cl
   jmp again         
   
   checking:mov di,offset password
   mov bx,offset array1
   mov ch,04h
  
   
   jmp security
   
   checking1:mov di,offset password
   mov bx,offset array1
   add bx,05h
   mov ch,04h 
   
   jmp security 
                
                
   checking2:mov di,offset password
   mov bx,offset array1
   add bx,0ah
   mov ch,04h
   
   jmp security 
   
   
   
   
   show_money:mov si,offset input+2
   
   cmp [si],31h
   jz money1
   cmp [si],32h
   jz money2
   cmp [si],33h
   jz money3
   lea dx,msg03
   mov ah,09h
   int 21h
   jmp done1
   
  
   
   money1: lea dx,newline
   mov ah,09h
   int 21h
   lea dx,msg09
   int 21h
   mov dx,offset person1_balance
   int 21h
   
   jmp done1   
   
   money2: lea dx,newline
   mov ah,09h
   int 21h 
   lea dx,msg09
   int 21h
   mov dx,offset person2_balance
   int 21h             
   jmp done1
   
   money3: lea dx,newline
   mov ah,09h
   int 21h  
   lea dx,msg09
   int 21h
   mov dx,offset person3_balance
   int 21h
   jmp done1  
   
   
   
   
   ;DEPOSIT MONEY STARTED
   
    DEPOSIT_MONEY: lea dx,newline
      mov ah,09h
      int 21h
      
     
     lea dx,msg01
     mov ah,09h
     int 21h
     mov dx,offset input
     mov ah,0ah
     int 21h
    
     mov ch,03
     mov si,offset array
    
     
     looping111:lea di,input+2
     
      mov cl,0bh
     mov dx,0000h
 
     
     looping11: cmp [si],30h  ;compare with 0 meaning 1 account no is checked with input and if valid account no it will acept ot
     jz next_number1 
    then1: mov bl,[si]
     
     cmp [di],'$'
     jz stop1
     cmp bl,[di]
     jz count1
     their1:inc di
     inc si
     dec cl
     jnz looping11
 
     dec ch
     jnz looping111 
     
     
     next_number1:     cmp dh,10  ;compare the bank account number which is matched with database
     jz stop1
     lea si,array
     add bp,0011  ;adding decimal 11 to reach to next bank accounnt number because in each occurance of 0 multiple of 11 need to add 
     add si,bp
     mov dh,00h
     jmp looping111
     
     
     stop1:cmp dh,0ah
     jz correct1
     
     mov dx,offset newline 
     mov ah,09h
     int 21h
     
     lea dx,msg03
     mov ah,09h
     int 21h
  
    ;Ending
     next1:lea dx,newline
     mov ah,09h
     int 21h
     
     
     
     
   mov ah,4ch ;termination
   int 21h  
     
     
     
   
  
  mov dx,offset newline 
     mov ah,09h
     int 21h
     
  
  correct1:  mov dx,offset newline 
     mov ah,09h
     int 21h
     
  mov dx,offset msg02
  mov ah,09h
  int 21h 
  lea dx,newline
     mov ah,09h
     int 21h
     
     lea dx,msg04
     mov ah,09h
     int 21h 
      
     retry1:mov si,offset password 
     mov ch,04h
    
     
     taking_input1:
     mov ah,08h ;take char input without echo
     int 21h                                 
     mov [si],al
     inc si
     mov dl,'*'
     mov ah,02h
     int 21h 
     dec ch
     jnz taking_input1
     
     jmp password_checking1
     
   end1:jmp next1 
   
   
   
     count1:inc dh
     jmp their1  
       
    
   password_checking1:mov cl,00h 
   mov si,offset input+2
   cmp [si],31h
   jz checking111
    cmp [si],32h
   jz checking11
    cmp [si],33h
   jz checking21
   
   done111:cmp cl,04h 
   jz send1
   lea dx,newline 
   mov ah,09h
   int 21h
   mov dx,offset msg08
   mov ah,09h
   int 21h
    lea dx,newline 
   mov ah,09h
   int 21h
   lea dx,msg10
   int 21h
   inc bh
 
   jmp retry1
   
   done11:jmp end1
   
   
   
    send1: lea dx,newline 
   mov ah,09h
   int 21h
    mov dx,offset msg07
   mov ah,09h
   int 21h 
   
   jmp dmoney
   
   ;jmp done11
         
   
    
   security1:mov dl,[bx]
   cmp [di],dl
   jz right1
   again1:inc bx
   inc di
   dec ch
   jnz security1
   
   jmp done111
   
   
   
   
   right1:inc cl
   jmp again1         
   
   checking111:mov di,offset password
   mov bx,offset array1
   mov ch,04h
  
   
   jmp security1
   
   checking11:mov di,offset password
   mov bx,offset array1
   add bx,05h
   mov ch,04h 
   
   jmp security1 
               
                
   checking21:mov di,offset password
   mov bx,offset array1
   add bx,0ah
   mov ch,04h
   
   jmp security1 
   
   
   ;Depositing money started
   dmoney: 
   mov ah,00h
   mov al,03h
   int 10h
   
   
   off:lea dx,newline
   mov ah,09h
   int 21h
   
   lea dx,msg11
   int 21h
   lea dx,msg12
   int 21h 
   
   mov si,offset input+2
   cmp [si],31h
   jz deposit1
   cmp [si],32h
   jz deposit2
   cmp [si],33h
   jz deposit3
   
              
              
   lea dx,newline
   mov ah,09h
   int 21h
   
   
   
   lea dx,msg09
   int 21h
   
   
    jmp done11   
    
    
   deposit1: lea dx,deposit         ;input taking amount to be deposited in varialble deposit for person1
   mov ah,0ah
   int 21h
  
   mov si,offset person1_balance+11
   mov di,offset deposit+9 
   mov bx,offset deposit_save   
   mov cl,08h
   call adding
   
       
   deposit2: lea dx,deposit        ;input taking amount to be deposited in varialble deposit  for persion 2
   mov ah,0ah
   int 21h
   mov si,offset person2_balance+11
   mov di,offset deposit+9 
   mov bx,offset deposit_save   
   mov cl,08h
   call adding
   
       
   deposit3: lea dx,deposit        ;input taking amount to be deposited in varialble deposit  for perdon 3
   mov ah,0ah
   int 21h
   mov si,offset person3_balance+11
   mov di,offset deposit+9 
   mov bx,offset deposit_save   
   mov cl,08h
   call adding
   
   
   
   adding:mov ch,[si]   ;adding deposit money and remaining money of bank
   sub ch,30h
   
   sub [di],30h
   add ch,[di]
   cmp ch,10
   jz print
   jnc print
   mov [bx],ch
   remaining:inc bx
   dec si
   dec di
   dec cl
   jnz adding
   
   lea dx,newline  ;next line
   mov ah,09h
   int 21h
   
   lea dx,msg09
   int 21h
   lea dx,msg12
   int 21h
   mov si,offset deposit_save+7
   
   mov cx,0008h
   
   start:mov dl,[si]   ;printing the money
   add dl, 30h
   mov ah,02h
   int 21h
   dec si
   loop start
   
   jmp done11
   
   
   
   
   
   print:mov dh,10    ;saving the added money in deposit_save in decimal
   mov ax,0000h
   mov al,ch
   div dh
   mov [bx],ah
   dec si
   add [si],al
   inc si
   jmp remaining
       
       
   ;WITHDRAWING LOGIC STARTED
       
     withdraw_money:lea dx,newline
      mov ah,09h
      int 21h
      
     
     lea dx,msg01
     mov ah,09h
     int 21h
     mov dx,offset input
     mov ah,0ah
     int 21h
    
     mov ch,03
     mov si,offset array
    
     
     looping122:lea di,input+2
     
      mov cl,0bh
     mov dx,0000h
 
     
     looping12: cmp [si],30h  ;compare with 0 meaning 1 account no is checked with input and if valid account no it will acept ot
     jz next_number2 
    then2: mov bl,[si]
     
     cmp [di],'$'
     jz stop2
     cmp bl,[di]
     jz count2
     their2:inc di
     inc si
     dec cl
     jnz looping12
 
     dec ch
     jnz looping122 
     
     
     next_number2:     cmp dh,10  ;compare the bank account number which is matched with database
     jz stop2
     lea si,array
     add bp,0011  ;adding decimal 11 to reach to next bank accounnt number because in each occurance of 0 multiple of 11 need to add 
     add si,bp
     mov dh,00h
     jmp looping122
     
     
     stop2:cmp dh,0ah
     jz correct2
     
     mov dx,offset newline 
     mov ah,09h
     int 21h
     
     lea dx,msg03
     mov ah,09h
     int 21h
  
    ;Ending
     next2:lea dx,newline
     mov ah,09h
     int 21h
     
     
     
     
   mov ah,4ch ;termination
   int 21h  
     
     
     
   
  
  mov dx,offset newline 
     mov ah,09h
     int 21h
     
  
  correct2:  mov dx,offset newline 
     mov ah,09h
     int 21h
     
  mov dx,offset msg02
  mov ah,09h
  int 21h 
  lea dx,newline
     mov ah,09h
     int 21h
     
     lea dx,msg04
     mov ah,09h
     int 21h 
      
     retry2:mov si,offset password 
     mov ch,04h
    
     
     taking_input2:
     mov ah,08h ;take char input without echo mean in screen we do not see what we give input.
     int 21h                                 
     mov [si],al
     inc si
     mov dl,'*'
     mov ah,02h
     int 21h 
     dec ch
     jnz taking_input2
     
     jmp password_checking2
     
   end2:jmp next2 
   
   
   
     count2:inc dh
     jmp their2  
       
    
   password_checking2:mov cl,00h 
   mov si,offset input+2
   cmp [si],31h
   jz checking122
    cmp [si],32h
   jz checking12
    cmp [si],33h
   jz checking22
   
   done122:cmp cl,04h 
   jz send2
   lea dx,newline 
   mov ah,09h
   int 21h
   mov dx,offset msg08
   mov ah,09h
   int 21h
    lea dx,newline 
   mov ah,09h
   int 21h
   lea dx,msg10
   int 21h
   inc bh
 
   jmp retry2
   
   done12:jmp end1
   
   
   
    send2: lea dx,newline 
   mov ah,09h
   int 21h
    mov dx,offset msg07
   mov ah,09h
   int 21h 
   jmp wmoney
   
   
   ;jmp done12
         
   
    
   security2:mov dl,[bx]
   cmp [di],dl
   jz right2
   again2:inc bx
   inc di
   dec ch
   jnz security2
   
   jmp done122
   
   
   
   
   right2:inc cl
   jmp again2         
   
   checking122:mov di,offset password
   mov bx,offset array1
   mov ch,04h
  
   
   jmp security2
   
   checking12:mov di,offset password
   mov bx,offset array1
   add bx,05h
   mov ch,04h 
   
   jmp security2 
               
                
   checking22:mov di,offset password
   mov bx,offset array1
   add bx,0ah
   mov ch,04h
   
   jmp security2   
       
   
   
   
   wmoney:mov ah,00h
   mov al,03h
   int 10h
   lea dx,newline
   mov ah,09h
   int 21h
   lea dx,msg13
   int 21h
   lea dx,msg12
   int 21h
   
   
   
   
   
   
     mov si,offset input+2
   cmp [si],31h
   jz withdraw1
   cmp [si],32h
   jz withdraw2
   cmp [si],33h
   jz withdraw3
   
              
              
   lea dx,newline
   mov ah,09h
   int 21h
   
   
   
   lea dx,msg09
   int 21h
   
   withdraw1:mov dx,offset withdraw
   mov ah,0ah
   int 21h
   
   lea si,person1_balance+11
   lea di,withdraw+9
   lea bx,withdraw_save
   mov cl,08h
   mov dh,00h
   call subtraction
    
    withdraw2:mov dx,offset withdraw
   mov ah,0ah
   int 21h
   
   lea si,person2_balance+11
   lea di,withdraw+9
   lea bx,withdraw_save
   mov cl,08h
   mov dh,00h 
   call subtraction
   
   withdraw3:mov dx,offset withdraw
   mov ah,0ah
   int 21h
   
   lea si,person3_balance+11
   lea di,withdraw+9
   lea bx,withdraw_save
   mov cl,08h
   mov dh,00h
   call subtraction 
   
   subtraction:
   mov ch,[si]
   sub ch,30h
   sub [di],30h
   cmp ch,[di]
   jc small
   sub ch,[di]
   mov [bx],ch
   now:inc bx
   dec si
   dec di
   dec cl
   jnz subtraction
   
   finish: lea dx,newline  ;next line
   mov ah,09h
   int 21h
   
   lea dx,msg09
   int 21h
   lea dx,msg12
   int 21h
   mov si,offset withdraw_save+7
   
   mov cx,0008h
   
   start2:mov dl,[si]   ;printing the money
   add dl, 30h
   mov ah,02h
   int 21h
   dec si
   loop start2
   
   jmp done12
   
   
   
   
   
   
   
   
   
   
   
   small:add ch,10
   sub ch,[di]
   dec si
   cmp [si],30h
   jz front
   sub [si],01h
   
   back:inc si
   mov [bx],ch
   jmp now
   
        
        
       
        
   front:add [si],09h   ;borrow logic in ioop until tyhe number finish if all are zero
   dec si 
   cmp [si],40h
   jnc limit
   cmp [si],30h
   jc limit
   
   jz front1
   sub [si],01h
  lolo1: cmp dh,00
   jnz lolo 
   inc si
   jmp back 
   
   front1:inc dh
 
   
   add [si],09h
   
   jmp front 
   
   lolo:inc si
   dec dh
   jmp lolo1 
   
   
   limit:lea dx,newline
   mov ah,09h
   int 21h
   mov dx,offset msg14
   mov ah,09h
   int 21h
   jmp finish 
   
   ;ACCOUNT CREATION STARTED
   
   create_account:mov ah,00h
   mov al,03h
   int 10h
   
   lea dx,newline
   mov ah,09h
   int 21h
   
   lea dx,msg15
   int 21h
   
   mov dx,offset yourname
   mov ah,0ah
   int 21h
   
    lea dx,newline
   mov ah,09h
   int 21h
   
   lea dx,msg19
   int 21h
   
   mov dx,offset accountno
   mov ah,0ah
   int 21h
   
     lea dx,newline
   mov ah,09h
   int 21h
   
   lea dx,msg16
   int 21h
   
    
   mov dx,offset password1
   mov ah,0ah
   int 21h
   
    lea dx,newline
   mov ah,09h
   int 21h 
   
   lea dx,msg17
   int 21h
   
   mov dx,offset password2
   mov ah,0ah
   int 21h
   
   lea dx,newline
   mov ah,09h
   int 21h
   
   lea dx,msg18
   int 21h 
   jmp done12