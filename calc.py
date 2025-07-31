import customtkinter as ctk
import math as m

class App(ctk.CTk):

    def AC(self):
        self.input.delete(0, "end")
        self.button_value.clear()
        self.result.configure(text = "Result: ")

    def Del(self):
        current_value = self.input.get()
        if current_value:
            self.input.delete(0, "end")
            self.input.insert(0, current_value[:-1])
        self.button_value.pop()

    def insert_list(self, value):
        self.button_value.append(value)

    def insert(self, value):
        current_value = self.input.get()
        self.input.delete(0, "end")
        self.input.insert(0, current_value + value)

    def calculate(self):
        try:
            result = eval(''.join(self.button_value))
            self.result.configure(text = f"Result: {result}")
        except ValueError:
            self.result.configure(text = "Enter numbers only")
        except Exception as e:
            self.result.configure(text = f"Result: Syntax Error")

    def __init__(self):
        super().__init__()
        self.button_value = []
        
        self.title("My Own Calculator")
        # self.geometry("330x430")
        self.maxsize(330, 530)
        self.minsize(330, 530)
        self.grid_columnconfigure((0, 1, 2, 3), weight=1)
        self.grid_rowconfigure(0, weight=1)

#frame
        self.frame = ctk.CTkFrame(self, corner_radius = 10)
        self.frame.grid(row=0, column=0, padx=20, pady=(70, 20), sticky = "nsew", columnspan=3)

        self.frame.grid_columnconfigure((0, 1, 2, 3), weight=1)
        self.frame.grid_rowconfigure((0, 1, 2, 3, 4, 5, 6, 7), weight=1)

#result labet
        self.result = ctk.CTkLabel(self, text = "Result: ", font=("Arial", 16))
        self.result.grid(row = 0, column = 0, padx = 10, pady = (60, 20), sticky = "new", columnspan = 5)
#entry
        self.input = ctk.CTkEntry(self, height = 35, font=("Arial", 16), corner_radius = 10)
        self.input.grid(row = 0, column = 0, padx = 20, pady = (20, 20), sticky = "new", columnspan = 5)
#buttons
#================================== row 0
        self.button_1 = ctk.CTkButton(self.frame, text = "1", fg_color = "#177898", corner_radius = 10, border_width = 2, command = lambda: [self.insert("1"), self.insert_list("1")])
        self.button_1.grid(row = 0, column = 0, padx = 10, pady = (35, 10), sticky = "nsew", columnspan = 1)

        self.button_2 = ctk.CTkButton(self.frame, text = "2", fg_color = "#177898", corner_radius = 10, border_width = 2, command = lambda: [self.insert("2"), self.insert_list("2")])
        self.button_2.grid(row = 0, column = 1, padx = 10, pady = (35, 10), sticky = "nsew", columnspan = 1)

        self.button_3 = ctk.CTkButton(self.frame, text = "3", fg_color = "#177898", corner_radius = 10, border_width = 2, command = lambda: [self.insert("3"), self.insert_list("3")])
        self.button_3.grid(row = 0, column = 2, padx = 10, pady = (35, 10), sticky = "nsew", columnspan = 1)

        self.button_plu = ctk.CTkButton(self.frame, text = "+", border_width = 2, fg_color ="#E96C5C", font=("Arial", 20), corner_radius = 20, hover_color = "#D23648", command = lambda: [self.insert("+"), self.insert_list("+")])
        self.button_plu.grid(row = 0, column = 3, padx = 10, pady = (35, 10), sticky = "nsew", columnspan = 1)
#================================== row 1
        self.button_4 = ctk.CTkButton(self.frame, text = "4", fg_color = "#177898", corner_radius = 10, border_width = 2, command = lambda: [self.insert("4"), self.insert_list("4")])
        self.button_4.grid(row = 1, column = 0, padx = 10, pady = 10, sticky = "nsew", columnspan = 1, rowspan = 1)

        self.button_5 = ctk.CTkButton(self.frame, text = "5", fg_color = "#177898", corner_radius = 10, border_width = 2, command = lambda: [self.insert("5"), self.insert_list("5")])
        self.button_5.grid(row = 1, column = 1, padx = 10, pady = 10, sticky = "nsew", columnspan = 1, rowspan = 1)

        self.button_6 = ctk.CTkButton(self.frame, text = "6", fg_color = "#177898", corner_radius = 10, border_width = 2, command = lambda: [self.insert("6"), self.insert_list("6")])
        self.button_6.grid(row = 1, column = 2, padx = 10, pady = 10, sticky = "nsew", columnspan = 1, rowspan = 1)

        self.button_min = ctk.CTkButton(self.frame, text = "-", border_width = 2, fg_color ="#E96C5C", font=("Arial", 20), corner_radius = 20, hover_color = "#D23648", command = lambda: [self.insert("-"), self.insert_list("-")])
        self.button_min.grid(row = 1, column = 3, padx = 10, pady = 10, sticky = "nsew", columnspan = 1, rowspan = 1)
#================================== row 2
        self.button_7 = ctk.CTkButton(self.frame, text = "7", fg_color = "#177898", corner_radius = 10, border_width = 2, command = lambda: [self.insert("7"), self.insert_list("7")])
        self.button_7.grid(row = 2, column = 0, padx = 10, pady = 10, sticky = "nsew", columnspan = 1, rowspan = 1)

        self.button_8 = ctk.CTkButton(self.frame, text = "8", fg_color = "#177898", corner_radius = 10, border_width = 2, command = lambda: [self.insert("8"), self.insert_list("8")])
        self.button_8.grid(row = 2, column = 1, padx = 10, pady = 10, sticky = "nsew", columnspan = 1, rowspan = 1)

        self.button_9 = ctk.CTkButton(self.frame, text = "9", fg_color = "#177898", corner_radius = 10, border_width = 2, command = lambda: [self.insert("9"), self.insert_list("9")])
        self.button_9.grid(row = 2, column = 2, padx = 10, pady = 10, sticky = "nsew", columnspan = 1, rowspan = 1)

        self.button_mul = ctk.CTkButton(self.frame, text = "×", border_width = 2, fg_color ="#E96C5C", font=("Arial", 20), corner_radius = 20, hover_color = "#D23648", command = lambda: [self.insert("×"), self.insert_list("*")])
        self.button_mul.grid(row = 2, column = 3, padx = 10, pady = 10, sticky = "nsew", columnspan = 1, rowspan = 1)
#================================== row 3
        self.button_dot = ctk.CTkButton(self.frame, text = ".", fg_color = "#177898", font=("Arial", 20), corner_radius = 10, border_width = 2, command = lambda: [self.insert("."), self.insert_list(".")])
        self.button_dot.grid(row = 3, column = 0, padx = 10, pady = 10, sticky = "nsew", columnspan = 1, rowspan = 1)

        self.button_0 = ctk.CTkButton(self.frame, text = "0", fg_color = "#177898", corner_radius = 10, border_width = 2, command = lambda: [self.insert("0"), self.insert_list("0")])
        self.button_0.grid(row = 3, column = 1, padx = 10, pady = 10, sticky = "nsew", columnspan = 1, rowspan = 1)

        self.button_eql = ctk.CTkButton(self.frame, text = "=", corner_radius = 100, border_width = 2, fg_color = "#22AEDD", command = self.calculate)
        self.button_eql.grid(row = 3, column = 2, padx = 10, pady = 10, sticky = "nsew", columnspan = 1, rowspan = 1)

        self.button_mul = ctk.CTkButton(self.frame, text = "÷", border_width = 2, fg_color ="#E96C5C", font=("Arial", 20), corner_radius = 20, hover_color = "#D23648", command = lambda: [self.insert("÷"), self.insert_list("/")])
        self.button_mul.grid(row = 3, column = 3, padx = 10, pady = 10, sticky = "nsew", columnspan = 1, rowspan = 1)
#================== row 4
        self.button_sqr = ctk.CTkButton(self.frame, text = "x²", corner_radius = 10, font=("Arial", 15), border_width = 2, command = lambda: [self.insert("²"), self.insert_list("**2")])
        self.button_sqr.grid(row = 4, column = 0, padx = 10, pady = 10, sticky = "nsew", columnspan = 1, rowspan = 1)

        self.button_sqrt = ctk.CTkButton(self.frame, text = "√", corner_radius = 10, font=("Arial", 15), border_width = 2, command = lambda: [self.insert("√("), self.insert_list("m.sqrt(")])
        self.button_sqrt.grid(row = 4, column = 1, padx = 10, pady = 10, sticky = "nsew", columnspan = 1, rowspan = 1)

        self.button_Del = ctk.CTkButton(self.frame, text = "Del", border_width = 2, fg_color = "#E54E45", font=("Arial", 15), corner_radius = 20, hover_color = "#DD2161", command = self.Del)
        self.button_Del.grid(row = 4, column = 2, padx = 10, pady = 10, sticky = "nsew", columnspan = 1, rowspan = 1)

        self.button_AC = ctk.CTkButton(self.frame, text = "AC", border_width = 2, fg_color ="#E44A40", font=("Arial", 15), corner_radius = 20, hover_color = "#DD2161", command = self.AC)
        self.button_AC.grid(row = 4, column = 3, padx = 10, pady = 10, sticky = "nsew", columnspan = 1, rowspan = 1)
#========================= row 5
        self.button_sqr = ctk.CTkButton(self.frame, text = "x³", corner_radius = 10, font=("Arial", 15), border_width = 2, command = lambda: [self.insert("³"), self.insert_list("**3")])
        self.button_sqr.grid(row = 5, column = 0, padx = 10, pady = 10, sticky = "nsew", columnspan = 1, rowspan = 1)

        self.button_sqrt = ctk.CTkButton(self.frame, text = "∛", corner_radius = 10, font=("Arial", 15), border_width = 2, command = lambda: [self.insert("∛("), self.insert_list("m.cbrt(")])
        self.button_sqrt.grid(row = 5, column = 1, padx = 10, pady = 10, sticky = "nsew", columnspan = 1, rowspan = 1)

        self.button_sqr = ctk.CTkButton(self.frame, text = "(", corner_radius = 10, font=("Arial", 15), border_width = 2, command = lambda: [self.insert("("), self.insert_list("(")])
        self.button_sqr.grid(row = 5, column = 2, padx = 10, pady = 10, sticky = "nsew", columnspan = 1, rowspan = 1)

        self.button_sqrt = ctk.CTkButton(self.frame, text = ")", corner_radius = 10, font=("Arial", 15), border_width = 2, command = lambda: [self.insert(")"), self.insert_list(")")])
        self.button_sqrt.grid(row = 5, column = 3, padx = 10, pady = 10, sticky = "nsew", columnspan = 1, rowspan = 1)
#========================= row 6
        self.button_sqr = ctk.CTkButton(self.frame, text = "xʸ", corner_radius = 10, font=("Arial", 15), border_width = 2, command = lambda: [self.insert("^("), self.insert_list("**(")])
        self.button_sqr.grid(row = 6, column = 0, padx = 10, pady = 10, sticky = "nsew", columnspan = 1, rowspan = 1)

        self.button_sqrt = ctk.CTkButton(self.frame, text = "x⁻¹", corner_radius = 10, font=("Arial", 15), border_width = 2, command = lambda: [self.insert("^-1"), self.insert_list("** -1")])
        self.button_sqrt.grid(row = 6, column = 1, padx = 10, pady = 10, sticky = "nsew", columnspan = 1, rowspan = 1)

        self.button_sqr = ctk.CTkButton(self.frame, text = "!", corner_radius = 10, font=("Arial", 15), border_width = 2, command = lambda: [self.insert("!("), self.insert_list("m.factorial(")])
        self.button_sqr.grid(row = 6, column = 2, padx = 10, pady = 10, sticky = "nsew", columnspan = 1, rowspan = 1)

        self.button_sqrt = ctk.CTkButton(self.frame, text = "log", corner_radius = 10, font=("Arial", 15), border_width = 2, command = lambda: [self.insert("log("), self.insert_list("m.log10(")])
        self.button_sqrt.grid(row = 6, column = 3, padx = 10, pady = 10, sticky = "nsew", columnspan = 1, rowspan = 1)
#========================= row 7
        self.button_sqr = ctk.CTkButton(self.frame, text = "sin", corner_radius = 10, font=("Arial", 15), border_width = 2, command = lambda: [self.insert("sin("), self.insert_list("m.sin(")])
        self.button_sqr.grid(row = 7, column = 0, padx = 10, pady = 10, sticky = "nsew", columnspan = 1, rowspan = 1)

        self.button_sqrt = ctk.CTkButton(self.frame, text = "cos", corner_radius = 10, font=("Arial", 15), border_width = 2, command = lambda: [self.insert("cos("), self.insert_list("m.cos(")])
        self.button_sqrt.grid(row = 7, column = 1, padx = 10, pady = 10, sticky = "nsew", columnspan = 1, rowspan = 1)

        self.button_sqr = ctk.CTkButton(self.frame, text = "tan", corner_radius = 10, font=("Arial", 15), border_width = 2, command = lambda: [self.insert("tan("), self.insert_list("m.tan(")])
        self.button_sqr.grid(row = 7, column = 2, padx = 10, pady = 10, sticky = "nsew", columnspan = 1, rowspan = 1)

        self.button_sqrt = ctk.CTkButton(self.frame, text = "π", corner_radius = 10, font=("Arial", 15), border_width = 2, command = lambda: [self.insert("π"), self.insert_list("m.pi")])
        self.button_sqrt.grid(row = 7, column = 3, padx = 10, pady = 10, sticky = "nsew", columnspan = 1, rowspan = 1)




app = App()
app.mainloop()
