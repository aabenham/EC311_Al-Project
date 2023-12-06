# code that will translate user input from the terminal into morse code (dots: ., and dashes: -)

def word_to_morse(word):
    # morese  
    morse_code_dict = {
        'A': '.-', 
        'B': '-...', 
        'C': '-.-.', 
        'D': '-..', 
        'E': '.', 
        'F': '..-.', 
        'G': '--.', 
        'H': '....', 
        'I': '..', 
        'J': '.---', 
        'K': '-.-', 
        'L': '.-..', 
        'M': '--', 
        'N': '-.', 
        'O': '---', 
        'P': '.--.', 
        'Q': '--.-', 
        'R': '.-.', 
        'S': '...', 
        'T': '-', 
        'U': '..-', 
        'V': '...-', 
        'W': '.--', 
        'X': '-..-', 
        'Y': '-.--', 
        'Z': '--..',
    }

    
    morse_code = ""

    for char in word:
        morse_char = morse_code_dict.get(char.upper(), '')  
        morse_code += morse_char + ' '                      

    return morse_code

# user input
user_input = input("Enter a word to convert to Morse code: ")
morse_code = word_to_morse(user_input)
print(morse_code)
