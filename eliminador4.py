def remove_second_and_third_names_lines_and_associated_numbers(input_file, output_file):
    with open(input_file, 'r') as infile, open(output_file, 'w') as outfile:
        names_count = 0  # Counter to track the occurrence of `.names` lines
        names_lines_to_remove = {1, 2}  # Lines to remove (2nd and 3rd)
        current_names_lines = []  # Buffer to hold lines between `.names`
        skip_lines = False  # Flag to skip lines

        for line in infile:
            if line.startswith('.names'):
                if names_count in names_lines_to_remove:
                    # Skip writing this line and all subsequent lines until another `.names` is found
                    skip_lines = True
                    names_count += 1
                    continue
                else:
                    # Write previously collected lines and reset buffer
                    for buffered_line in current_names_lines:
                        outfile.write(buffered_line)
                    current_names_lines = []
                    names_count += 1
                    skip_lines = False  # Reset the flag if not skipping lines

            if skip_lines:
                if not line.startswith('.names'):
                    continue  # Skip the current line if the flag is set
                else:
                    # If a new `.names` line is found, stop skipping
                    skip_lines = False
            
            # Buffer lines if not skipping
            current_names_lines.append(line)
        
        # Write any remaining buffered lines
        for buffered_line in current_names_lines:
            outfile.write(buffered_line)

# Usage
remove_second_and_third_names_lines_and_associated_numbers('/home/moises-leiva/vtr_work/quickstart/sumador_16bits/exacto/temp/sumador_16bits.pre-vpr.blif', '/home/moises-leiva/vtr_work/quickstart/sumador_16bits/exacto/temp/eliminando4.blif')
