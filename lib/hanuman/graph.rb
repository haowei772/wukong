module Hanuman

  class Graph < Stage
    include Gorillib::FancyBuilder

    # a retrievable name for this graph
    field      :name,   Symbol
    # the sequence of stages on this graph
    collection :stages, Hanuman::Stage

    def tree(options={})
      super.merge( :stages => stages.to_a.map{|stage| stage.tree(options) } )
    end

    # #
    # # @example
    # #   streamer(:iter, File.open('/foo/bar'))
    # #
    # def add_stage(type, handle=nil, *args, &block)
    #   stage = Wukong.create(type, handle, *args, &block)
    #   stage.graph = self
    #   @chain << stage
    #   stage
    # end
    #
    # def source(handle=nil, *args, &block)
    #   add_stage(:source, handle, *args, &block)
    # end
    #
    # # synonym for switch?
    # def multi
    # end
    #
    # def switch
    # end
    #
    # def input
    #   chain.first
    # end
    #
    # def run
    #   d{ self }
    #   input.tell(:beg_stream)
    #   input.run
    #   input.finally
    #   input.tell(:end_stream)
    # end

  end
end