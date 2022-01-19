module testAdder4; // Testbench module
    parameter N = 11; //size of the test set
    reg [3:0] addend; // create the 4-bit addend variable A
    reg [3:0] augend ; // create a 4-bit augend variable to hold B
    reg cin;  // carry in
    wire [3:0] sum; // a net to route sum as ouptut
    wire cout; // carry out
    reg [3:0] addend_array [1:N];
    reg [1:N] cin_array;
    reg [3:0] augend_array [1:N];
    reg [3:0] sum_array [1:N];
    reg [1:N] cout_array;

    initial
        begin
            //initi ali zation of addend_array
            addend_array[1] =  4'b0111;
            addend_array[2] =  4'b1101;
            addend_array[3] =  4'b0101;
            addend_array[4] =  4'b1101;
            addend_array[5] =  4'b0111;
            addend_array[6] =  4'b1000;
            addend_array[7] =  4'b0111;
            addend_array[8] =  4'b1000;
            addend_array[9] =  4'b0000;
            addend_array[10] = 4'b1111;
            addend_array[11] = 4'b0000;

            //initialization of cin_array
            cin_array[1] =  1'b0;
            cin_array[2] =  1'b0;
            cin_array[3] =  1'b0;
            cin_array[4] =  1'b0;
            cin_array[5] =  1'b1;
            cin_array[6] =  1'b0;
            cin_array[7] =  1'b0;
            cin_array[8] =  1'b0;
            cin_array[9] =  1'b1;
            cin_array[10] = 1'b1;
            cin_array[11] = 1'b0;

            //initialization of augend_array
            augend_array[1] =  4'b0101;
            augend_array[2] =  4'b0101;
            augend_array[3] =  4'b1101;
            augend_array[4] =  4'b1101;
            augend_array[5] =  4'b0111;
            augend_array[6] =  4'b0111;
            augend_array[7] =  4'b1000;
            augend_array[8] =  4'b1000;
            augend_array[9] =  4'b1101;
            augend_array[10] = 4'b1111;
            augend_array[11] = 4'b0000;

            //initialization of sum_array (expected sum outputs)
            sum_array[1] =  4'b1100;
            sum_array[2] =  4'b0010;
            sum_array[3] =  4'b0010;
            sum_array[4] =  4'b1010;
            sum_array[5] =  4'b1111;
            sum_array[6] =  4'b1111;
            sum_array[7] =  4'b1111;
            sum_array[8] =  4'b0000;
            sum_array[9] =  4'b1110;
            sum_array[10] = 4'b1111;
            sum_array[11] = 4'b0000;

            //initialization of cout_array (expected carry output)
            cout_array[1] =  1'b0;
            cout_array[2] =  1'b1;
            cout_array[3] =  1'b1;
            cout_array[4] =  1'b1;
            cout_array[5] =  1'b0;
            cout_array[6] =  1'b0;
            cout_array[7] =  1'b0;
            cout_array[8] =  1'b1;
            cout_array[9] =  1'b0;
            cout_array[10] = 1'b1;
            cout_array[11] = 1'b0;
        end
    integer i;
    always
        begin
            for ( i = 1 ; i <= N ; i =i + 1 )
                begin
                    $display(i);
                    addend <= addend_array[i]; // assign test data to the addend vector
                    augend <= augend_array[i]; // assign test data to the augend vector
                    cin    <=    cin_array[i]; // assign carry in

                    #40; // delay for 40 time units

                    if (!(sum == sum_array[i & cout == cout_array[i]]))
                        begin
                            $write("ERROR: ");
                            $display("Wrong Answer ");
                        end
                    
                    else
                        begin
                          $display("Correct!!");
                        end
                end
            $display("Test Finished");
        end
    Adder4 add4(addend, augend, cin, sum, cout); // instantiate four-bit adder module
endmodule