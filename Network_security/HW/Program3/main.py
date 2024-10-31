def load_valid_words(filename):
    """从文件加载有效单词"""
    with open(filename, 'r') as file:
        return set(word.strip().upper() for word in file.readlines())

import spacy

# Load spacy model for check sentence meaning
nlp = spacy.load("en_core_web_sm")

def is_meaningful_sentence(sentence):
    # Make sure every words is valid
    # words = sentence.split()
    
    # for word in words:
    #     if word.upper() not in valid_words:
    #         return False

    # Syntax analysis
    doc = nlp(sentence)
    # for token in doc:
    #     print(f"Token: {token.text}, POS: {token.pos_}, Dep: {token.dep_}")
    # Token: Meet, POS: VERB, Dep: ROOT , # Token: She, POS: SUBJECT, Dep: nsubj
    # Token: me, POS: PRON, Dep: dobj
    # Token: at, POS: ADP, Dep: prep
    # Token: the, POS: DET, Dep: det
    # Token: park, POS: NOUN, Dep: pobj
    # Token: ., POS: PUNCT, Dep: punct

    # Check if exist noun or pronoun
    subjects = [token for token in doc if token.dep_ == "nsubj" or token.dep_ == "dobj"]
    # Check if exist verb
    verbs = [token for token in doc if token.pos_ == "VERB"]
    # print(doc,":",subjects,":",verbs)
    # If not exist subject and verb return false
    if not subjects or not verbs:
        return False
    #print("确保有主语和动词")

    if len(doc) < 3:  # At least 1 verb and 2 noun/pronoun
        return False
    #print("确保句子不是简单的词汇组合")
    return True

  
def can_form_sentence(s, memo):
    # Base case: if the string is empty, return a list with an empty string
    if s == "":
        return [""]  # An empty string can be considered a valid segment
    
    # Check if the result for this substring is already computed
    if s in memo:
        return memo[s]
    
    # List to store valid sentences
    result = []
    
    # Iterate through the string to find valid words
    for i in range(1, len(s) + 1):
        word = s[:i]
        if word in valid_words:
            # Recursively call for the remaining string
            rest = can_form_sentence(s[i:], memo)
            for segment in rest:  # Collect all segments from the rest
                # Create a new sentence with the current word
                if segment:  # If the rest is not empty
                    result.append(word + " " + segment)
                else:  # If the rest is empty
                    result.append(word)
    
    # Store the result in memo
    memo[s] = result if result else []
    return memo[s]

def process_string(input_string):
    memo = {}
    sentences = can_form_sentence(input_string, memo)
    
    # Return all valid sentences or ""
    return sentences if sentences else ""

# Example usage
if __name__ == "__main__":
    valid_words = load_valid_words("./words.txt")
    input_string = input()# "abcd" #"meetmeatthepark"  # 
    capitalized_string = input_string.upper() # Make sure is capital letter
    results = process_string(capitalized_string)
    #print(results)
    if len(results)>1:
        for result in results:
            # print(type(result))
            if is_meaningful_sentence(result):
                print(result)
    else:
        print("Nonsense")