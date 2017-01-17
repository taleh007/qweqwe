class Question
    attr_accessor :question
    attr_accessor :task_id
    attr_accessor :level
    attr_accessor :answer
    attr_accessor :resolve_time
    attr_accessor :message

    def initialize(question, task_id, level, resolve_time=0, answer="", message="")
      @question = question
      @task_id = task_id
      @level = level
      @answer = answer
      @resolve_time = resolve_time
      @message = message
    end
end
class String
  def del_punc
    self.gsub(/[\~\!\@\#\$\%\^\&\*\(\)\_\+\`\-\=\№\;\?\/\,\.\/\;\'\[\]\\\|\{\}\:\"\<\>\? \—]/,"")
  end
  def del_dunc
    self.tr("«»\~\!\@\#\$\^\&\*\(\)\_\+\`\=\№\;\?\/\,\.\/\;\'\[\]\\\|\{\}\:\"\<\>\?\—","")
  end
end

data_a = JSON.parse File.read(File.expand_path("./db/poems-full.json") )

$hash_lines={}
data_a.each{|x| x[1].each{|y|  $hash_lines[Unicode::downcase(y.del_punc)]= x[0] }}

$data_s = {}
data_a.map{|x| x.last}.flatten.uniq.each do |x|
  str = x.del_dunc
  mas = str.split(' ')
  mas.each_with_index do |t, i|
    if $data_s[[mas[0...i], mas[(i+1)..-1]]]
      $data_s[[mas[0...i], mas[(i+1)..-1]]] = ([$data_s[[mas[0...i], mas[(i+1)..-1]]]] << t).flatten
    else
      $data_s[[mas[0...i], mas[(i+1)..-1]]] = t
    end
  end
end

$tasks=[]
ADDR=URI("http://pushkin.rubyroidlabs.com/quiz")
class Solver
  def self.solve question

  end

  private
    def self.first_task

    end
end
