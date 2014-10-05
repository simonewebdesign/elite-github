require 'date'

module Elite
  class Github

    DIRECTORY_LISTING_LIMIT = 1000

    # def initialize(*args, &block)
    # end

    def self.run(contributions_int = 1337)
      # from_date = Date.today - contributions_int
      # to_date   = Date.today

      (1..contributions_int).to_a.reverse.each_slice(DIRECTORY_LISTING_LIMIT) do |slice|

        random_dir_name = random_str
        Dir.mkdir random_dir_name
        Dir.chdir random_dir_name do

          slice.each do |i|

            the_date = Date.today - i

            random_file_name = random_str
            `touch #{random_file_name}` # TODO use something more portable
            `git add .`
            `git commit -m "Add #{random_file_name}" --date='#{the_date}'`
          end
        end
      end

      puts "Done! You can now `git push`."
    end

    private

    def self.random_str
      ('a'..'z').to_a.shuffle[0,8].join
    end
  end
end
